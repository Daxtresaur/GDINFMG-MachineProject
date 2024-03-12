using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public static class Web
{
    public static Dictionary<string, CharacterData> character_data { get; private set; } = new();
    public static string note { get; private set; }
    public static IEnumerator GetAllCharacterData()
    {
        string uri = "http://localhost/MP/GetAllCharacters.php";
        using (UnityWebRequest webRequest = UnityWebRequest.Get(uri))
        {
            // Request and wait for the desired page.
            yield return webRequest.SendWebRequest();

            string[] pages = uri.Split('/');
            int page = pages.Length - 1;

            switch (webRequest.result)
            {
                case UnityWebRequest.Result.ConnectionError:
                case UnityWebRequest.Result.DataProcessingError:
                    Debug.LogError(pages[page] + ": Error: " + webRequest.error);
                    break;
                case UnityWebRequest.Result.ProtocolError:
                    Debug.LogError(pages[page] + ": HTTP Error: " + webRequest.error);
                    break;
                case UnityWebRequest.Result.Success:
                    Debug.Log(pages[page] + ":\nReceived: " + webRequest.downloadHandler.text);
                    break;
            }

            string[] rows = webRequest.downloadHandler.text.Split("\n");
            for (int i = 0; i < rows.Length - 1; i++)
            {
                string[] columns = rows[i].Split(",");
                CharacterData cData = new(columns[0], columns[1], columns[2], columns[3], columns[4], columns[5]);
                character_data.Add(cData.frame, cData);
            }
        }
    }

    public static IEnumerator GetCharacterDescription(string frame)
    {
        string uri = "http://localhost/MP/GetCharacterDescription.php";
        WWWForm form = new();
        form.AddField("frame", frame);

        using (UnityWebRequest www = UnityWebRequest.Post(uri, form))
        {
            yield return www.SendWebRequest();

            if (www.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError(www.error);
            }
            else
            {
                note = www.downloadHandler.text;
            }
        }
    }
}

public struct CharacterData
{
    public CharacterData(string id, string name, string frame, string rank, string element, string cClass)
    {
        this.id = id;
        this.name = name;
        this.frame = frame;
        this.rank = rank;
        this.element = element;
        this.cClass = cClass;
    }

    public string id { get; private set; }
    public string name { get; private set; }
    public string frame { get; private set; }
    public string rank { get; private set; }
    public string element { get; private set; }
    public string cClass { get; private set; }
}

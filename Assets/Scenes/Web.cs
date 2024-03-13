using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class Web : MonoBehaviour
{
    public static Dictionary<string, CharacterData> character_data { get; private set; } = new();
    public static bool IsLoadingCharacterData { get; private set; } = true;

    private void Start()
    {
        StartCoroutine(GetAllCharacterData());
    }

    private IEnumerator GetAllCharacterData()
    {
        IsLoadingCharacterData = true;
        string uri = "http://localhost/MP/GetAllCharacters.php";
        using (UnityWebRequest webRequest = UnityWebRequest.Get(uri))
        {
            // Request and wait for the desired page.
            yield return webRequest.SendWebRequest();

            string[] cPages = uri.Split('/');
            int cPage = cPages.Length - 1;

            switch (webRequest.result)
            {
                case UnityWebRequest.Result.ConnectionError:
                case UnityWebRequest.Result.DataProcessingError:
                    Debug.LogError(cPages[cPage] + ": Error: " + webRequest.error);
                    break;
                case UnityWebRequest.Result.ProtocolError:
                    Debug.LogError(cPages[cPage] + ": HTTP Error: " + webRequest.error);
                    break;
                case UnityWebRequest.Result.Success:
                    Debug.Log(cPages[cPage] + ":\nReceived: " + webRequest.downloadHandler.text);
                    break;
            }

            string[] rows = webRequest.downloadHandler.text.Split("\n");
            for (int i = 0; i < rows.Length - 1; i++)
            {
                string[] columns = rows[i].Split(",");

                string textUri = $"{Application.streamingAssetsPath}/CharacterThumbnails/{columns[2]}.png";
                UnityWebRequest texRequest = UnityWebRequestTexture.GetTexture(textUri);
                yield return texRequest.SendWebRequest();
                string[] tPages = uri.Split('/');
                int tPage = tPages.Length - 1;

                switch (texRequest.result)
                {
                    case UnityWebRequest.Result.ConnectionError:
                    case UnityWebRequest.Result.DataProcessingError:
                        Debug.LogError(tPages[tPage] + ": Error: " + texRequest.error);
                        continue;
                    case UnityWebRequest.Result.ProtocolError:
                        Debug.LogError(tPages[tPage] + ": HTTP Error: " + texRequest.error);
                        continue;
                    case UnityWebRequest.Result.Success:
                        Debug.Log(tPages[tPage] + ":\nReceived: " + texRequest.downloadHandler.text);
                        break;
                }

                Texture2D texture2D = ((DownloadHandlerTexture)texRequest.downloadHandler).texture;
                Sprite sprite = Sprite.Create(texture2D, new(0, 0, texture2D.width, texture2D.height), new Vector2(0.5f, 1f));
                
                CharacterData cData = new(/*columns[0], */columns[1], columns[2], columns[3], columns[4], columns[5], sprite);
                character_data.Add(cData.frame, cData);
            }
        }
        IsLoadingCharacterData = false;
    }
}

public struct CharacterData
{
    public CharacterData(/*string id, */string name, string frame, string rank, string element, string cClass, Sprite sprite)
    {
        //this.id = id;
        this.name = name;
        this.frame = frame;
        this.rank = rank;
        this.element = element;
        this.cClass = cClass;
        this.sprite = sprite;
    }

    //public string id { get; private set; }
    public string name { get; private set; }
    public string frame { get; private set; }
    public string rank { get; private set; }
    public string element { get; private set; }
    public string cClass { get; private set; }
    public Sprite sprite { get; private set; }
}
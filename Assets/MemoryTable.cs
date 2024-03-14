using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class MemoryTable : MonoBehaviour
{
    [SerializeField] private Transform contentParent;
    [SerializeField] private MemorySetRow rowPrefab;
    List<MemorySetRow> rowList = new List<MemorySetRow>();

    public IEnumerator Co_SetMemoryTable(string frame)
    {
        string wUri = "http://localhost/MP/GetMemorySet.php";
        WWWForm form = new();
        form.AddField("frame", frame);

        using (UnityWebRequest www = UnityWebRequest.Post(wUri, form))
        {
            yield return www.SendWebRequest();

            if (www.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError(www.error);
            }
            else
            {
                string[] row = www.downloadHandler.text.Split("\\");

                int length = row.Length - 1;
                SetRows(length);
                for (int i = 0; i < length; i++)
                {
                    MemorySetRow msr = rowList[i];
                    msr.SetRow(row[i]);
                }
            }
        }
        
    }

    public void SetRows(int numOfRows)
    {
        if(numOfRows < rowList.Count)
        {
            while (rowList.Count != numOfRows)
            {
                Destroy(rowList[0].gameObject);
                rowList.RemoveAt(0);
            }
        }
        else if(numOfRows > rowList.Count)
        {
            while (rowList.Count != numOfRows)
            {
                MemorySetRow row = Instantiate(rowPrefab, contentParent);
                rowList.Add(row);
            }
        }
    }
}

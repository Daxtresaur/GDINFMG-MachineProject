using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class MemorySetRow : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI[] memorySet = new TextMeshProUGUI[3];
    [SerializeField] private TextMeshProUGUI topResonance;
    [SerializeField] private TextMeshProUGUI bottomResonance;
    [SerializeField] private TextMeshProUGUI usage;
    [SerializeField] private TextMeshProUGUI notes;

    public void SetRow(string row)
    {
        string[] column = row.Split("~");

        Debug.Log(column[0]);
        memorySet[0].SetText(column[1]);
        memorySet[1].SetText(column[2]);
        memorySet[2].SetText(column[3]);
        topResonance.SetText(column[4].Replace(";", ",\n"));
        bottomResonance.SetText(column[5].Replace(";", ",\n"));
        usage.SetText(column[6]);
    }
}

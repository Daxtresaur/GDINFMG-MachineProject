using System.Collections;
using System.Collections.Generic;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;

public class MemorySetRow : MonoBehaviour
{
    [SerializeField] private Transform viewport;
    [SerializeField] private RectTransform anchor;
    [SerializeField] private RectTransform notesPanel;
    [SerializeField] private TextMeshProUGUI[] memorySet = new TextMeshProUGUI[3];
    [SerializeField] private TextMeshProUGUI topResonance;
    [SerializeField] private TextMeshProUGUI bottomResonance;
    [SerializeField] private TextMeshProUGUI usage;
    [SerializeField] private TextMeshProUGUI notes;

    private void OnDestroy()
    {
        Destroy(notesPanel.gameObject);
    }

    private void Update()
    {
        
    }

    public void SetRow(string row)
    {
        gameObject.SetActive(true);
        notesPanel.SetParent(viewport);
        notesPanel.SetAsLastSibling();
        
        notesPanel.sizeDelta = Vector2.right * 400f + Vector2.up * 150f;
        notesPanel.anchoredPosition = -anchor.anchoredPosition + Vector2.left * 250f;
        string[] column = row.Split("~");

        Debug.Log(column[0]);
        memorySet[0].SetText(column[1]);
        memorySet[1].SetText(column[2]);
        memorySet[2].SetText(column[3]);
        topResonance.SetText(column[4].Replace(";", ",\n"));
        bottomResonance.SetText(column[5].Replace(";", ",\n"));
        usage.SetText(column[6]);
        notes.SetText(column[7]);
    }
}

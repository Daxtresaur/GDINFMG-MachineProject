using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
public class PainCagePanel : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI boss_nameText;

    public void OpenMe(string boss_name)
    {
        GDRUIManager.GetInstance().OpenPanel(transform);
        this.boss_nameText.SetText(boss_name);
    }
}

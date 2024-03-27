using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;

public class IndividualTeamPanel : MonoBehaviour
{
    public int id { get; private set; }
    [SerializeField] private Image blueImg;
    [SerializeField] private TextMeshProUGUI blueName;

    [SerializeField] private Image redImg;
    [SerializeField] private TextMeshProUGUI redName;

    [SerializeField] private Image yellowImg;
    [SerializeField] private TextMeshProUGUI yellowName;

    public IEnumerator SetPanel(TeamData teamData)
    {
        yield return Web.GetAllCharacterData();

        this.id = teamData.id;
        blueImg.sprite = Web.character_data[teamData.blue].sprite;
        blueName.SetText(teamData.blue);

        redImg.sprite = Web.character_data[teamData.red].sprite;
        redName.SetText(teamData.red);

        yellowImg.sprite = Web.character_data[teamData.yellow].sprite;
        yellowName.SetText(teamData.yellow);
    }
}

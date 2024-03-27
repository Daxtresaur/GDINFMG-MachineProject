using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;

public class IndividualTeamPanel : MonoBehaviour
{
    public int id { get; private set; }
    [SerializeField] private Image blueImg;
    [SerializeField] private Image redImg;
    [SerializeField] private Image yellowImg;

    public IEnumerator SetPanel(TeamData teamData)
    {
        yield return Web.GetAllCharacterData();

        this.id = teamData.id;
        blueImg.sprite = Web.character_data[teamData.blue].sprite;
        redImg.sprite = Web.character_data[teamData.red].sprite;
        yellowImg.sprite = Web.character_data[teamData.yellow].sprite;
    }
}

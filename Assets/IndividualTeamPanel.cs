using System.Collections;
using System.Collections.Generic;
using TMPro;
using Unity.VisualScripting;
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

    [SerializeField] private GameObject blueLeaderObject;
    [SerializeField] private GameObject redLeaderObject;
    [SerializeField] private GameObject yellowLeaderObject;

    public IEnumerator SetPanel(TeamData teamData)
    {
        yield return Web.GetAllCharacterData();

        this.id = teamData.id;
        Debug.Log("Blue: " + teamData.blue.ToString());
        blueImg.sprite = Web.character_data[teamData.blue].sprite;
        blueName.SetText(teamData.blue);

        Debug.Log("Red: " + teamData.red.ToString());
        redImg.sprite = Web.character_data[teamData.red].sprite;
        redName.SetText(teamData.red);

        Debug.Log("Yellow: " + teamData.yellow.ToString());
        yellowImg.sprite = Web.character_data[teamData.yellow].sprite;
        yellowName.SetText(teamData.yellow);
    }

    public IEnumerator SetPanel(BuiltTeamData teamData)
    {
        yield return Web.GetAllCharacterData();

        this.id = teamData.id;
        Debug.Log("Blue: " + teamData.blue.ToString());
        if (Web.character_data.TryGetValue(teamData.blue, out CharacterData blue))
        {
            blueImg.sprite = blue.sprite;
            blueName.SetText(teamData.blue);
        }
        else
        {
            blueImg.sprite = default;
            blueName.SetText("Character 1");
        }

        Debug.Log("Red: " + teamData.red.ToString());
        if (Web.character_data.TryGetValue(teamData.red, out CharacterData red))
        {
            redImg.sprite = red.sprite;
            redName.SetText(teamData.red);
        }
        else
        {
            redImg.sprite = default;
            redName.SetText("Character 2");
        }

        Debug.Log("Yellow: " + teamData.yellow.ToString());
        if (Web.character_data.TryGetValue(teamData.yellow, out CharacterData yellow))
        {
            yellowImg.sprite = yellow.sprite;
            yellowName.SetText(teamData.yellow);
        }
        else
        {
            yellowImg.sprite = default;
            yellowName.SetText("Character 3");
        }
        
        SetLeader(teamData);
    }

    // NOTE: If working, this should be a Built Team-only function.
    //       Functionality for WarZone teams can be integrated but am too deadbrained.
    private void SetLeader(BuiltTeamData teamData)
    {
        blueLeaderObject.SetActive(false);
        redLeaderObject.SetActive(false);
        yellowLeaderObject.SetActive(false);

        if (teamData.leader == null) { }
        else if (teamData.leader.ToString() == teamData.blue.ToString()) blueLeaderObject.SetActive(true);
        else if (teamData.leader.ToString() == teamData.red.ToString()) redLeaderObject.SetActive(true);
        else if (teamData.leader.ToString() == teamData.yellow.ToString()) yellowLeaderObject.SetActive(true);
        else Debug.LogWarning("Unknown leader type: " + teamData.leader);
    }

    public string GetLeader()
    {
        if (blueLeaderObject.activeSelf == true) return blueLeaderObject.transform.parent.parent.name.ToString();
        else if (redLeaderObject.activeSelf == true) return redLeaderObject.transform.parent.parent.name.ToString();
        else if (yellowLeaderObject.activeSelf == true) return yellowLeaderObject.transform.parent.parent.name.ToString();

        return null;
    }
}

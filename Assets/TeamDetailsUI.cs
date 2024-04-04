using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Xml.Linq;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;

public class TeamDetailsUI : MonoBehaviour
{
    [SerializeField] private CreateTeamUI createTeamUI;
    [SerializeField] private IndividualTeamPanel selectedPanel;
    [SerializeField] private string[] teamCharacterFrames = new string[] { "frame1", "frame2", "frame3" };
    [SerializeField] private List<Sprite> Class;
    [SerializeField] private List<Sprite> Rank;
    [SerializeField] private List<Sprite> Element;
    [SerializeField] private TMP_Dropdown ElementDropdown;

    [Header("Blue Character")]
    public Image Blue_Image;
    public TextMeshProUGUI Blue_Name;
    private string Blue_Frame;
    public Image Blue_Class;
    public TextMeshProUGUI Blue_ClassName;
    public Image Blue_Rank;
    public Toggle Blue_LeadToggle;
    public Image Blue_Element1;
    public TextMeshProUGUI Blue_Element1Name;
    public Image Blue_Element2;
    public TextMeshProUGUI Blue_Element2Name;

    [Header("Red Character")]
    public Image Red_Image;
    public TextMeshProUGUI Red_Name;
    private string Red_Frame;
    public Image Red_Class;
    public TextMeshProUGUI Red_ClassName;
    public Image Red_Rank;
    public Toggle Red_LeadToggle;
    public Image Red_Element1;
    public TextMeshProUGUI Red_Element1Name;
    public Image Red_Element2;
    public TextMeshProUGUI Red_Element2Name;

    [Header("Yellow Character")]
    public Image Yellow_Image;
    public TextMeshProUGUI Yellow_Name;
    private string Yellow_Frame;
    public Image Yellow_Class;
    public TextMeshProUGUI Yellow_ClassName;
    public Image Yellow_Rank;
    public Toggle Yellow_LeadToggle;
    public Image Yellow_Element1;
    public TextMeshProUGUI Yellow_Element1Name;
    public Image Yellow_Element2;
    public TextMeshProUGUI Yellow_Element2Name;


    // Start is called before the first frame update
    void Start()
    {
        selectedPanel = createTeamUI.GetSelectedTeamPanel();
        GetCharacterFrames();
        SetElementDropdown();
        SetLeadToggle(selectedPanel.GetLeader());
        StartCoroutine(LoadTeamDetails());
    }

    private void OnEnable()
    {
        Debug.Log("Enabled yeet");
        Start();
    }

    private void OnDisable()
    {
        Debug.Log("Disabled yeet");
    }

    private IEnumerator LoadTeamDetails()
    {
        yield return Web.GetAllCharacterData();

        // Iterate over each character frame in the team
        for (int i = 0; i < teamCharacterFrames.Length; i++)
        {
            string frame = teamCharacterFrames[i];

            if (Web.character_data.TryGetValue(frame, out CharacterData characterData))
            {
                SetCharacterDetails(i, characterData);
            }
            else
            {
                Debug.LogWarning("Character with frame " + frame + " not found. Setting default values.");
                SetDefaultCharacterDetails(i);
            }
        }
    }

    private void SetCharacterDetails(int index, CharacterData characterData)
    {
        switch (index)
        {
            case 0:
                SetCharacterDetails(Blue_Image, Blue_Name, Blue_Class, Blue_ClassName, Blue_Rank, Blue_LeadToggle, Blue_Element1, Blue_Element1Name, Blue_Element2, Blue_Element2Name, characterData);
                Blue_Frame = characterData.frame;
                break;

            case 1:
                SetCharacterDetails(Red_Image, Red_Name, Red_Class, Red_ClassName, Red_Rank, Red_LeadToggle, Red_Element1, Red_Element1Name, Red_Element2, Red_Element2Name, characterData);
                Red_Frame = characterData.frame;
                break;

            case 2:
                SetCharacterDetails(Yellow_Image, Yellow_Name, Yellow_Class, Yellow_ClassName, Yellow_Rank, Yellow_LeadToggle, Yellow_Element1, Yellow_Element1Name, Yellow_Element2, Yellow_Element2Name, characterData);
                Yellow_Frame = characterData.frame;
                break;

            default:
                break;
        }
    }

    private void SetCharacterDetails(Image image, TextMeshProUGUI nameText, Image classImage, TextMeshProUGUI classNameText, Image rankImage, Toggle leadToggle, Image element1Image, TextMeshProUGUI element1NameText, Image element2Image, TextMeshProUGUI element2NameText, CharacterData characterData)
    {
        image.sprite = characterData.sprite;
        nameText.text = characterData.name;
        classImage.sprite = GetClassSprite(characterData.cClass);
        classNameText.text = characterData.cClass;
        rankImage.sprite = GetRankSprite(characterData.rank);

        // Splits the elements string and handle each element, basically the easiest thing i can find
        string[] elements = characterData.element.Split(';');
        if (elements.Length > 0)
        {
            element1Image.sprite = GetElementSprite(elements[0]);
            element1NameText.text = elements[0];
        }
        else
        {
            element1Image.sprite = null;
            element1NameText.text = "";
        }

        if (elements.Length > 1)
        {
            element2Image.sprite = GetElementSprite(elements[1]);
            element2Image.color = new Color(255, 255, 255, 255);
            element2NameText.text = elements[1];
        }
        else
        {
            element2Image.sprite = null;
            element2Image.color = new Color(255, 255, 255, 0);  // Makes the sprite invisible if no element is present
            element2NameText.text = "";
        }
    }

    private void SetDefaultCharacterDetails(int index)
    {
        switch (index)
        {
            case 0:
                Blue_Image.sprite = default;
                Blue_Name.text = "Character";
                Blue_Class.sprite = default;
                Blue_ClassName.text = "Class";
                Blue_Rank.sprite = default;
                Blue_Element1.sprite = default;
                Blue_Element1Name.text = "Element 1";
                Blue_Element2.sprite = default;
                Blue_Element2.color = new Color(255, 255, 255, 255);
                Blue_Element2Name.text = "Element 2";   
                break;

            case 1:
                Red_Image.sprite = default;
                Red_Name.text = "Character";
                Red_Class.sprite = default;
                Red_ClassName.text = "Class";
                Red_Rank.sprite = default;
                Red_Element1.sprite = default;
                Red_Element1Name.text = "Element 1";
                Red_Element2.sprite = default;
                Red_Element2.color = new Color(255, 255, 255, 255);
                Red_Element2Name.text = "Element 2";
                break;

            case 2:
                Yellow_Image.sprite = default;
                Yellow_Name.text = "Character";
                Yellow_Class.sprite = default;
                Yellow_ClassName.text = "Class";
                Yellow_Rank.sprite = default;
                Yellow_Element1.sprite = default;
                Yellow_Element1Name.text = "Element 1";
                Yellow_Element2.sprite = default;
                Yellow_Element2.color = new Color(255, 255, 255, 255);
                Yellow_Element2Name.text = "Element 2";
                break;

            default:
                break;
        }
    }

    private Sprite GetClassSprite(string cClass)
    {
        Sprite sprite = null;
        switch (cClass.ToString()) 
        {
            case "Attacker":
                sprite = Class[0];
                break;

            case "Tank":
                sprite = Class[1];
                break;

            case "Support":
                sprite = Class[2];
                break;

            case "Amplifier":
                sprite = Class[3];
                break;

            case "Vanguard":
                sprite = Class[4];
                break;

            default: break;
        }

        return sprite;
    }

    private Sprite GetElementSprite(string element)
    {
        Sprite sprite = null;
        switch (element.ToString())
        {
            case "Physical":
                sprite = Element[0];
                break;

            case "Fire":
                sprite = Element[1];
                break;

            case "Lightning":
                sprite = Element[2];
                break;

            case "Ice":
                sprite = Element[3];
                break;

            case "Dark":
                sprite = Element[4];
                break;

            default: break;
        }

        return sprite;
    }

    private Sprite GetRankSprite(string rank)
    {
        Sprite sprite = null;
        switch (rank.ToString())
        {
            case "S":
                sprite = Rank[0];
                break;

            case "A":
                sprite = Rank[1];
                break;

            case "B":
                sprite = Rank[2];
                break;

            default : break;
        }
        return sprite;
    }

    private void SetLeadToggle(string leader)
    {
        if (leader == null) return;

        Red_LeadToggle.isOn = false;
        Blue_LeadToggle.isOn = false;
        Yellow_LeadToggle.isOn = false;

        if (Red_LeadToggle.name.Contains(leader))
        {
            Red_LeadToggle.isOn = true;
            Debug.Log("red toggle on");
        }
        else if (Blue_LeadToggle.name.Contains(leader))
        {
            Blue_LeadToggle.isOn = true;
            Debug.Log("blue toggle on");
        }
        else if (Yellow_LeadToggle.name.Contains(leader))
        {
            Yellow_LeadToggle.isOn = true;
            Debug.Log("yellow toggle on");
        }
    }

    private string GetLeadToggle()
    {
        if (Red_LeadToggle.isOn)
            return Red_Frame.ToString();
        else if (Blue_LeadToggle.isOn)
            return Blue_Frame.ToString();
        else if (Yellow_LeadToggle.isOn)
            return Yellow_Frame.ToString();

        return null;
    }

    public void OnSaveButtonClicked()
    {
        string teamID = createTeamUI.GetTeamNumber(selectedPanel).ToString();
        string[] characterFrames = teamCharacterFrames;
        string leader = GetLeadToggle();
        string element = ElementDropdown.options[ElementDropdown.value].text;

        Debug.Log(teamID + ", " + leader + ", " + element);

        StartCoroutine(SaveTeamData(teamID, characterFrames, leader, element));
        createTeamUI.OnRefresh();
    }

    private IEnumerator SaveTeamData(string teamID, string[] characterFrames, string leader, string element)
    {
        // Create a form to send data to PHP script
        string url = "http://localhost/MP/UpdateBuiltTeam.php";
        string blueFrame = characterFrames[0];
        string redFrame = characterFrames[1];
        string yellowFrame = characterFrames[2];

        WWWForm form = new();
        form.AddField("teamID", teamID);
        form.AddField("blueFrame", blueFrame);
        form.AddField("redFrame", redFrame);
        form.AddField("yellowFrame", yellowFrame);
        form.AddField("leader", leader);
        form.AddField("element", element);

        // Send data to PHP script
        using (UnityWebRequest www = UnityWebRequest.Post(url, form))
        {
            yield return www.SendWebRequest();
            
            string[] cPages = url.Split('/');
            int cPage = cPages.Length - 1;

            switch (www.result)
            {
                case UnityWebRequest.Result.ConnectionError:
                case UnityWebRequest.Result.DataProcessingError:
                    Debug.LogError(cPages[cPage] + ": Error: " + www.error);
                    break;
                case UnityWebRequest.Result.ProtocolError:
                    Debug.LogError(cPages[cPage] + ": HTTP Error: " + www.error);
                    break;
                case UnityWebRequest.Result.Success:
                    Debug.Log(cPages[cPage] + ":\nReceived: " + www.downloadHandler.text);
                    break;
            }
        }
    }

    public void GetCharacterFrames()
    {
        // If no errors, then child should be named "TeamGroup".
        Transform team = selectedPanel.transform.GetChild(1);

        Transform blue = team.GetChild(0);
        Transform red = team.GetChild(1);
        Transform yellow = team.GetChild(2);

        teamCharacterFrames[0] = blue.GetChild(1).gameObject.GetComponent<TextMeshProUGUI>().text;
        teamCharacterFrames[1] = red.GetChild(1).gameObject.GetComponent<TextMeshProUGUI>().text;
        teamCharacterFrames[2] = yellow.GetChild(1).gameObject.GetComponent<TextMeshProUGUI>().text;
    }

    private void SetElementDropdown()
    {
        ElementDropdown.value = ElementDropdown.options.FindIndex(option => option.text == createTeamUI.GetElement(selectedPanel));
        Debug.LogError("Element Found: " + ElementDropdown.value);
    }

}

using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;

public class CharacterChangePanel : MonoBehaviour
{
    [SerializeField] private Transform character_parentPanel;
    // [SerializeField] private GameObject character_infoPanel;
    [SerializeField] private Button buttonPrefab;

    [SerializeField] private CreateTeamUI createTeamUI;
    [SerializeField] private IndividualTeamPanel selectedPanel;
    [SerializeField] private TeamDetailsUI TeamDetailsPanel;
    private int characterIndex = -1;

    [Header("Set Image")]
    [SerializeField] private Image overwriteImage;
    [SerializeField] private TextMeshProUGUI frameText;

    // Start is called before the first frame update
    private void Start()
    {
        StartCoroutine(Co_LoadCharacters());
    }

    public void OnRefresh()
    {
        Debug.Log("refreshed charchange");
        DestroyClone();
        StartCoroutine(Co_LoadCharacters());
    }

    private void DestroyClone()
    {
        foreach (Transform child in character_parentPanel)
        {
            Debug.Log(child.name);
            if (child.name.Contains("Clone"))
            {
                Destroy(child.gameObject);
            }
        }
    }

    private IEnumerator Co_LoadCharacters()
    {
        Web.character_data.Clear();
        yield return new WaitForSeconds(0.2f);
        yield return Web.GetAllCharacterData();
        foreach (CharacterData cd in Web.character_data.Values)
        {
            Button buttonClone = Instantiate(buttonPrefab, character_parentPanel);
            buttonClone.GetComponentInChildren<Image>().sprite = cd.sprite;
            buttonClone.GetComponentInChildren<TextMeshProUGUI>().SetText(cd.frame);
            buttonClone.onClick.AddListener(() => SetImage(cd.frame));
            buttonClone.gameObject.SetActive(true);
        }

        string frame = TeamDetailsPanel.teamCharacterFrames[characterIndex];
        if (Web.character_data.TryGetValue(frame, out CharacterData characterData))
        {
            overwriteImage.sprite = characterData.sprite;
            frameText.text = characterData.frame;
        }
        else
        {
            Debug.LogWarning("Character with frame " + frame + " not found. Setting default values.");
            overwriteImage.sprite = default;
            frameText.text = frame;
        }
    }

    public void SetCharacterIndex(int index)
    {
        characterIndex = index;
        OnRefresh();
    }

    public void SetImage(string frame)
    {
        if (Web.character_data.TryGetValue(frame, out CharacterData characterData))
        {
            overwriteImage.sprite = characterData.sprite;
            frameText.text = characterData.frame;
        }
        else
        {
            Debug.LogWarning("Character with frame " + frame + " not found. Setting default values.");
            overwriteImage.sprite = default;
            frameText.text = frame;
        }
    }

    public void OnSaveButtonClicked()
    {
        string frame = GetCharacterFrame();
        string frameName = frameText.text;
        string teamID = createTeamUI.GetTeamNumber(selectedPanel).ToString();

        Debug.Log(frame + ", " + frameName + ", " + teamID);
        StartCoroutine(SaveCharacter(frame, frameName, teamID));
        
    }

    private IEnumerator SaveCharacter(string frame, string frameName, string teamID)
    {
        yield return new WaitForSeconds(0.2f);
        string url = "http://localhost/MP/EditCharacter.php";

        WWWForm form = new();
        form.AddField("frame", frame);
        form.AddField("frameName", frameName);
        form.AddField("teamID", teamID);

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

        TeamDetailsPanel.OnRefresh();
    }

    private string GetCharacterFrame()
    {
        switch (characterIndex)
        {
            case 0: return "blue";
            case 1: return "red";
            case 2: return "yellow";
            default:
                break;
        }

        return null;
    }
}

using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;
using static System.Net.WebRequestMethods;

public class CreateTeamUI : MonoBehaviour
{
    [SerializeField] private IndividualTeamPanel TeamPrefab;
    [SerializeField] private Transform ParentObject;
    
    [SerializeField] private IndividualTeamPanel selectedTeamPanel;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(InitializePanels());
    }

    public void OnRefresh()
    {
        Debug.Log("refreshed");
        DestroyClone();
        StartCoroutine(InitializePanels());
    }

    private void DestroyClone()
    {
        foreach (Transform child in ParentObject)
        {
            Debug.Log(child.name);
            if (child.name.Contains("Clone"))
            {
                Destroy(child.gameObject);
            }
        }
        selectedTeamPanel = null;
    }

    public IEnumerator InitializePanels()
    {
        yield return new WaitForSeconds(0.1f);
        Web.builtteam_data.Clear();
        yield return Web.GetAllBuiltTeams();

        foreach (var teams in Web.builtteam_data.Values)
        {
            IndividualTeamPanel panel = InstantiateTeamPanel();
            yield return panel.SetPanel(teams);
            SetElement(teams.element, panel);
            SetTeamNumber(teams.id, panel);
            ActivateIndividualPanels(panel);
        }
    }

    private IndividualTeamPanel InstantiateTeamPanel()
    {
        IndividualTeamPanel panel = Instantiate(TeamPrefab, ParentObject);
        return panel;
    }

    public void OnTeamPanelClicked(IndividualTeamPanel clickedPanel)
    {
        selectedTeamPanel = clickedPanel;
    }

    public IndividualTeamPanel GetSelectedTeamPanel()
    {
        Debug.Log("Team Panel: " + selectedTeamPanel.name.ToString());
        return selectedTeamPanel;
    }

    public void AddEmptyTeam()
    {
        StartCoroutine(SetEmptyTeam());
    }

    public IEnumerator SetEmptyTeam()
    {
        string url = "http://localhost/MP/InsertEmptyTeam.php";
        WWWForm form = new();

        using (UnityWebRequest webRequest = UnityWebRequest.Post(url, form))
        {
            yield return webRequest.SendWebRequest();

            if (webRequest.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError("Error: " + webRequest.error);
            }

            else
            {
                int newTeamID = int.Parse(webRequest.downloadHandler.text);
                // Debug.Log("New Team ID: " + newTeamID);

                // Instantiate and activate new team panel with the new team ID
                IndividualTeamPanel panel = InstantiateTeamPanel();
                SetTeamNumber(newTeamID, panel);
                ActivateIndividualPanels(panel);
            }
        }
    }

    public void SetElement(string element, IndividualTeamPanel panel)
    {
        Transform text = panel.gameObject.transform.Find("Element Text");
        text.Find("Element").gameObject.GetComponent<TextMeshProUGUI>().text = element;
    }

    public string GetElement(IndividualTeamPanel panel)
    {
        Transform text = panel.gameObject.transform.Find("Element Text");
        return text.Find("Element").gameObject.GetComponent<TextMeshProUGUI>().text;
    }

    public void SetTeamNumber(int num, IndividualTeamPanel panel)
    {
        panel.gameObject.GetComponent<TextMeshProUGUI>().text = "Team " + (num);
    }

    public int GetTeamNumber(IndividualTeamPanel panel)
    {
        TextMeshProUGUI textComponent = panel.gameObject.GetComponent<TextMeshProUGUI>();
        string text = textComponent.text;

        Debug.Log("Team No.: " + text);
        string[] parts = text.Split(' ');
        if (parts.Length > 1)
        {
            string numberString = parts[parts.Length - 1];
            if (int.TryParse(numberString, out int number))
            {
                Debug.Log("Final Team No.: " + text);
                return number;
            }
        }

        return -1;
    }


    public void ActivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(true);
    }

    public void DeactivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(false);
    }

    private IEnumerator DeleteTeamData(string teamID)
    {
        // Create a form to send data to PHP script
        string url = "http://localhost/MP/DeleteBuiltTeam.php";
        WWWForm form = new();
        form.AddField("teamID", teamID);

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

    public void OnDeleteButtonClicked(IndividualTeamPanel panel)
    {
        int teamID = GetTeamNumber(panel);
        StartCoroutine(DeleteTeamData(teamID.ToString()));
        OnRefresh(); // Refresh the list after deletion
    }
}

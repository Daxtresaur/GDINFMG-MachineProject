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

    public IEnumerator InitializePanels()
    {
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
        // Set the clicked panel as the selected panel
        selectedTeamPanel = clickedPanel;
    }

    public IndividualTeamPanel GetSelectedTeamPanel()
    {
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

    public void SetTeamNumber(int num, IndividualTeamPanel panel)
    {
        panel.gameObject.GetComponent<TextMeshProUGUI>().text = "Team " + (num);
    }

    public void ActivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(true);
    }

    public void DeactivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(false);
    }
}

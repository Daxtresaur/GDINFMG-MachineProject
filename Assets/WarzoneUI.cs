using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using TMPro;
using System.Collections.Specialized;
using UnityEngine.Networking;

public class WarzoneUI : MonoBehaviour
{
    [SerializeField] TMP_InputField CharacterInputField;
    [SerializeField] TMP_Dropdown ElementDropDown;
    [SerializeField] WarzoneTeamsPanel WarzoneTeamsPanelPrefab;
    [field: SerializeField] private IndividualTeamPanel TeamPrefab;
    [SerializeField] Dictionary<string, WarzoneTeamsPanel> WarzoneElement = new Dictionary<string, WarzoneTeamsPanel>();
    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(Co_InitializePanels());
    }

    public IEnumerator Co_InitializePanels()
    {
        yield return Web.GetAllTeams();

        List<string> elements = new();
        foreach (var teams in Web.team_data.Values)
        {
            WarzoneTeamsPanel wtpClone;
            if (WarzoneElement.ContainsKey(teams.element))
            {
                wtpClone = WarzoneElement[teams.element];
            }
            else
            {
                wtpClone = Instantiate(WarzoneTeamsPanelPrefab, transform);
                wtpClone.Element.SetText("Element: " + teams.element + "\n");
                wtpClone.gameObject.SetActive(true);
                WarzoneElement.Add(teams.element, wtpClone);
            }

            
            IndividualTeamPanel panel = Instantiate(TeamPrefab, wtpClone.transform);
            yield return panel.SetPanel(teams);
            if (teams.competitive) panel.transform.SetSiblingIndex(wtpClone.Main.transform.GetSiblingIndex() + 1);
            else panel.transform.SetSiblingIndex(wtpClone.F2P.transform.GetSiblingIndex() + 1);
            panel.gameObject.SetActive(true);
            wtpClone.AddIndividualPanel(panel, teams.competitive);
            wtpClone.ActivateIndividualPanels(panel);
        }

        ElementDropDown.AddOptions(WarzoneElement.Keys.ToList());
    }
    
    public void FilterByElement()
    {
        foreach (var panel in WarzoneElement)
        {
            if (panel.Key != ElementDropDown.options[ElementDropDown.value].text)
                panel.Value.gameObject.SetActive(false);
            else
                panel.Value.gameObject.SetActive(true);
        }
    }

    public void CreateFilterQuery()
    {
        string query = "WHERE ";

        //Add Element
        bool hasElement = false;
        string element = ElementDropDown.options[ElementDropDown.value].text;
        if (element != "-")
        {
            query = query + $"element = '{ElementDropDown.options[ElementDropDown.value].text}'";
            hasElement = true;
        }

        string character = CharacterInputField.text;

        if (character.Length > 0 && hasElement) query += " AND ";
        query = character.Length > 0 ? query + $"(blue LIKE '{character}%' OR red LIKE '{character}%' OR yellow LIKE '{character}%')" : query;
        query = query == "WHERE " ? "" : query;
        Debug.Log($"QUERY: {query}");
        StartCoroutine(Co_FilterTeams(query));
    }

    public IEnumerator Co_FilterTeams(string filter)
    {
        yield return Web.GetAllCharacterData();

        //Always returns all ids
        string wUri = "http://localhost/MP/FilterTeams.php";
        WWWForm form = new();

        //No need to add SELECT id FROM teams
        form.AddField("filterSQL", filter);

        using (UnityWebRequest www = UnityWebRequest.Post(wUri, form))
        {
            yield return www.SendWebRequest();

            if (www.result != UnityWebRequest.Result.Success)
            {
                Debug.LogError(www.error);
            }
            else
            {
                string[] ids = www.downloadHandler.text.Split(",");
                foreach (WarzoneTeamsPanel wzTeamPanels in WarzoneElement.Values)
                {
                    foreach (IndividualTeamPanel iTeamPanel in wzTeamPanels.individualTeamPanels)
                    {
                        if (ids.Contains(iTeamPanel.id.ToString()))
                        {
                            wzTeamPanels.ActivateIndividualPanels(iTeamPanel);
                        }
                        else
                        {
                            wzTeamPanels.DeactivateIndividualPanels(iTeamPanel);
                        }
                    }
                }
            }
        }
    }
    //public IEnumerator Co_FilterByColor(string color, string frame)
    //{

    //}
}

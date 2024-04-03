using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using static System.Net.WebRequestMethods;

public class CreateTeamUI : MonoBehaviour
{
    [SerializeField] private IndividualTeamPanel TeamPrefab;
    [SerializeField] private Transform ParentObject;
    private string Leader;
    private int ID;
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
            IndividualTeamPanel panel = Instantiate(TeamPrefab, ParentObject);
            yield return panel.SetPanel(teams);
            ID = teams.id;
            SetElement(teams.element, panel);
            SetTeamNumber(ID, panel);
            ActivateIndividualPanels(panel);
            //UIChange(teams);
        }
    }

    public void UIChange(BuiltTeamData teams)
    {
        Leader = teams.leader;
        SetLeaderTag();
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

    public void SetLeaderTag()
    {
        
    }
    public void ActivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(true);
        // ResetPanels();
    }

    public void DeactivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(false);
        // ResetPanels();
    }
}

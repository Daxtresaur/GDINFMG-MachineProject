using System.Collections;
using System.Collections.Generic;
using System.Linq;
using TMPro;
using UnityEngine;

public class WarzoneTeamsPanel : MonoBehaviour
{
    [field: SerializeField] public TextMeshProUGUI Element { get; private set; }
    [field: SerializeField] public Transform Main { get; private set; }
    [field: SerializeField] public Transform F2P { get; private set; }

    public List<IndividualTeamPanel> individualTeamPanels { get; private set; } = new();
    public List<IndividualTeamPanel> mainTeams { get; private set; } = new();
    public List<IndividualTeamPanel> f2PTeams { get; private set; } = new();

    public void AddIndividualPanel(IndividualTeamPanel panel, bool competitive)
    {
        individualTeamPanels.Add(panel);
        
        if(competitive) mainTeams.Add(panel);
        else f2PTeams.Add(panel);
    }

    public void ActivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(true);
        ResetPanels();
    }

    public void DeactivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(false);
        ResetPanels();
    }

    public void ResetPanels()
    {
        gameObject.SetActive(individualTeamPanels.Where(x => x.gameObject.activeSelf).Count() > 0);
        Main.gameObject.SetActive(mainTeams.Where(x => x.gameObject.activeSelf).Count() > 0);
        F2P.gameObject.SetActive(f2PTeams.Where(x => x.gameObject.activeSelf).Count() > 0);
    }
}

using System.Collections;
using System.Collections.Generic;
using System.Linq;
using TMPro;
using UnityEngine;

public class WarzoneTeamsPanel : MonoBehaviour
{
    [field: SerializeField] public TextMeshProUGUI Element { get; private set; }
    [field: SerializeField] public Transform Main;
    [field: SerializeField] public Transform F2P;

    public List<IndividualTeamPanel> individualTeamPanels { get; private set; } = new();

    public void AddIndividualPanel(IndividualTeamPanel panel)
    {
        individualTeamPanels.Add(panel);
    }

    public void ActivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(true);
        if (individualTeamPanels.Where(x => x.gameObject.activeSelf).Count() > 0) gameObject.SetActive(true);
    }

    public void DeactivateIndividualPanels(IndividualTeamPanel panel)
    {
        panel.gameObject.SetActive(false);
        if (individualTeamPanels.Where(x => x.gameObject.activeSelf).Count() == 0) gameObject.SetActive(false);
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Unity.VisualScripting;

public class BossesHUB : MonoBehaviour
{
    [SerializeField] private PainCagePanel painCagePanel;
    [SerializeField] private Transform alpha_boss_parentPanel;
    [SerializeField] private Transform beta_boss_parentPanel;
    [SerializeField] private Transform gamma_boss_parentPanel;

    //[SerializeField] private GameObject character_infoPanel;
    [SerializeField] private Button buttonPrefab;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(Co_LoadBosses());
    }

    private IEnumerator Co_LoadBosses()
    {
        yield return Web.GetAllBosses();

        //Debug.Log(Web.bosses_data.Count);
        foreach (BossesData bd in Web.bosses_data.Values)
        {
            Button buttonClone;
            if (bd.group == 'a')
            {
                buttonClone = Instantiate(buttonPrefab, alpha_boss_parentPanel);
                
            }
            else if(bd.group == 'b')
            {
                buttonClone = Instantiate(buttonPrefab, beta_boss_parentPanel);
            }
            else if(bd.group == 'y')
            {
                buttonClone = Instantiate(buttonPrefab, gamma_boss_parentPanel);
            }
            else
            {
                continue;
            }

            buttonClone.GetComponentInChildren<Image>().sprite = bd.sprite;
            buttonClone.GetComponentInChildren<TextMeshProUGUI>().SetText(bd.name);
            buttonClone.gameObject.SetActive(true);
            buttonClone.onClick.AddListener(() => OpenPainCagePanel(bd));
            //buttonClone.onClick.AddListener(() => OpenInfoPanel(cd.frame));
        }
    }

    public void OpenPainCagePanel(BossesData bossesData)
    {
        painCagePanel.OpenMe(bossesData.name, bossesData.weakness);
    }
}

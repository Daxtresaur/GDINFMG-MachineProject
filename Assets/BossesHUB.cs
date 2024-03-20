using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class BossesHUB : MonoBehaviour
{
    [SerializeField] private Transform boss_parentPanel;
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

        Debug.Log(Web.bosses_data.Count);
        foreach (BossesData bd in Web.bosses_data.Values)
        {
            Button buttonClone = Instantiate(buttonPrefab, boss_parentPanel);
            //buttonClone.GetComponentInChildren<Image>().sprite = cd.sprite;
            buttonClone.GetComponentInChildren<TextMeshProUGUI>().SetText(bd.name);
            //buttonClone.onClick.AddListener(() => OpenInfoPanel(cd.frame));
            buttonClone.gameObject.SetActive(true);
        }
    }
}

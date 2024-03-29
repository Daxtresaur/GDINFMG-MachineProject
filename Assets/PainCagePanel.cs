using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Linq;
using UnityEngine.Networking;
using System;

public class PainCagePanel : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI boss_nameText;
    [SerializeField] private TextMeshProUGUI boss_affixesText;
    [SerializeField] private Transform content;
    [SerializeField] private Transform main;
    [SerializeField] private Transform f2p;
    [SerializeField] private IndividualTeamPanel teamPanel;

    public void OpenMe(string boss_name, string affixes)
    {
        GDRUIManager.GetInstance().OpenPanel(transform);
        this.boss_nameText.SetText(boss_name);
        boss_affixesText.SetText(boss_name);
        StartCoroutine(FillTeams($"WHERE element = '{affixes}';"));
    }

    IEnumerator FillTeams(string filter)
    {
        yield return Web.GetAllTeams();

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
                foreach(IndividualTeamPanel itp in content.GetComponentsInChildren<IndividualTeamPanel>())
                {
                    Destroy(itp.gameObject);
                }

                string result = www.downloadHandler.text;
                if (result != "0 results")
                {
                    string[] ids = result.Split(",");
                    for (int i = 0; i < ids.Length - 1; i++)
                    {
                        //Debug.Log($"ID: {id}");
                        int id = int.Parse(ids[i]);
                        TeamData data = Web.team_data[id];
                        IndividualTeamPanel itpClone = Instantiate(teamPanel, content);

                        if (data.competitive)
                        {
                            itpClone.transform.SetSiblingIndex(main.GetSiblingIndex() + 1);
                        }
                        else
                        {
                            itpClone.transform.SetSiblingIndex(f2p.GetSiblingIndex() + 1);
                        }

                        yield return itpClone.SetPanel(data);
                        itpClone.gameObject.SetActive(true);
                    }
                }
                else
                {
                    foreach (TeamData data in Web.team_data.Values)
                    {
                        IndividualTeamPanel itpClone = Instantiate(teamPanel, content);

                        if (data.competitive)
                        {
                            itpClone.transform.SetSiblingIndex(main.GetSiblingIndex() + 1);
                        }
                        else
                        {
                            itpClone.transform.SetSiblingIndex(f2p.GetSiblingIndex() + 1);
                        }

                        yield return itpClone.SetPanel(data);
                        itpClone.gameObject.SetActive(true);
                    }
                }
            }
        }
    }
}

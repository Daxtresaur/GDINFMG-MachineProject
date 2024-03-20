using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;
using TMPro;
using System.Runtime.CompilerServices;

public class CharacterSelectionPanel : MonoBehaviour
{
    [SerializeField] private Transform character_parentPanel;
    [SerializeField] private GameObject character_infoPanel;
    [SerializeField] private Button buttonPrefab;

    [Header("Character Info panel")]
    [SerializeField] private TextMeshProUGUI charName;
    [SerializeField] private TextMeshProUGUI charFrame;
    [SerializeField] private TextMeshProUGUI charRank;
    [SerializeField] private TextMeshProUGUI charClass;
    [SerializeField] private TextMeshProUGUI charElement;
    [SerializeField] private TextMeshProUGUI charWeapon;
    [SerializeField] private TextMeshProUGUI charWeaponNotes;
    [SerializeField] private Image charIcon;
    [Header("Note panel")]
    [SerializeField] private TextMeshProUGUI charDescription;
    [Header("Memory Set Table")]
    [SerializeField] private MemoryTable mTable;

    [SerializeField]
    private void Start()
    {
        StartCoroutine(Co_LoadCharacters());
    }

    private IEnumerator Co_LoadCharacters()
    {
        yield return Web.GetAllCharacterData();
        foreach (CharacterData cd in Web.character_data.Values)
        {
            Button buttonClone = Instantiate(buttonPrefab, character_parentPanel);
            buttonClone.GetComponentInChildren<Image>().sprite = cd.sprite;
            buttonClone.GetComponentInChildren<TextMeshProUGUI>().SetText(cd.frame);
            buttonClone.onClick.AddListener(() => OpenInfoPanel(cd.frame));
            buttonClone.gameObject.SetActive(true);
        }
    }

    public void OpenInfoPanel(string frame)
    {
        StartCoroutine(Co_OpenInfoPanel(frame));
    }

    public IEnumerator Co_OpenInfoPanel(string frame)
    {
        yield return Web.GetAllCharacterData();

        if (Web.character_data.TryGetValue(frame, out CharacterData data))
        {
            GDRUIManager.GetInstance().OpenPanel(character_infoPanel.transform);
            charName.SetText(data.name);
            charFrame.SetText(data.frame);
            charRank.SetText(data.rank);
            charClass.SetText(data.cClass);
            charElement.SetText(data.element);
            charIcon.sprite = data.sprite;

            string wUri = "http://localhost/MP/GetSignatureWeapon.php";
            WWWForm form = new();
            form.AddField("frame", frame);

            using (UnityWebRequest www = UnityWebRequest.Post(wUri, form))
            {
                yield return www.SendWebRequest();

                if (www.result != UnityWebRequest.Result.Success)
                {
                    Debug.LogError(www.error);
                }
                else
                {
                    string[] weaponData = www.downloadHandler.text.Split(",");
                    charWeapon.SetText(weaponData[0]);
                    if (weaponData.Length >= 2) { charWeaponNotes.SetText(weaponData[1]); }
                }
            }

            string dUri = "http://localhost/MP/GetCharacterDescription.php";

            using (UnityWebRequest www = UnityWebRequest.Post(dUri, form))
            {
                yield return www.SendWebRequest();

                if (www.result != UnityWebRequest.Result.Success)
                {
                    Debug.LogError(www.error);
                }
                else
                {
                    string note = www.downloadHandler.text;
                    charDescription.SetText(note.Replace(";", "\n\n"));
                }
            }

            yield return mTable.Co_SetMemoryTable(frame);
        }
    }
}

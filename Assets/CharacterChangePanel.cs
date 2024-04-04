using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class CharacterChangePanel : MonoBehaviour
{
    [SerializeField] private Transform character_parentPanel;
    // [SerializeField] private GameObject character_infoPanel;
    [SerializeField] private Button buttonPrefab;

    [SerializeField] private TeamDetailsUI TeamDetailsPanel;
    [SerializeField] private IndividualTeamPanel teamPanel;

    [Header("Set Image")]
    [SerializeField] private Image characterImage;
    [SerializeField] private TextMeshProUGUI frameText;

    // Start is called before the first frame update
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
            //buttonClone.onClick.AddListener(() => OpenInfoPanel(cd.frame));
            buttonClone.gameObject.SetActive(true);
        }
    }

    public void SelectCharacter(GameObject character)
    {
        teamPanel.SetSelectedCharacter(character);
    }

    // Example method to retrieve the selected character
    public void ShowSelectedCharacter()
    {
        GameObject selectedCharacter = teamPanel.GetSelectedCharacter();
        if (selectedCharacter != null)
        {
            Debug.Log("Selected character: " + selectedCharacter.name);
        }
        else
        {
            Debug.Log("No character selected.");
        }
    }

}

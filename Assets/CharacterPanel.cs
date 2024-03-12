using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;
using TMPro;

public class CharacterPanel : MonoBehaviour
{
    [SerializeField] private Transform character_parentPanel;
    [SerializeField] private GameObject character_infoPanel;
    [SerializeField] private Button buttonPrefab;

    [Header("Character Info panel")]
    [SerializeField] private TextMeshProUGUI frameName;
    [SerializeField] private TextMeshProUGUI frameDesc;
    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(Co_LoadCharacters());
    }

    private IEnumerator Co_LoadCharacters()
    {
        yield return Web.GetAllCharacterData();

        foreach (string key in Web.character_data.Keys)
        {
            string uri = $"{Application.streamingAssetsPath}/CharacterThumbnails/{Web.character_data[key].frame}.png";
            UnityWebRequest request = UnityWebRequestTexture.GetTexture(uri);
            yield return request.SendWebRequest();
            string[] pages = uri.Split('/');
            int page = pages.Length - 1;

            switch (request.result)
            {
                case UnityWebRequest.Result.ConnectionError:
                case UnityWebRequest.Result.DataProcessingError:
                    Debug.LogError(pages[page] + ": Error: " + request.error);
                    continue;
                case UnityWebRequest.Result.ProtocolError:
                    Debug.LogError(pages[page] + ": HTTP Error: " + request.error);
                    continue;
                case UnityWebRequest.Result.Success:
                    Debug.Log(pages[page] + ":\nReceived: " + request.downloadHandler.text);
                    break;
            }

            Button buttonClone = Instantiate(buttonPrefab, character_parentPanel);

            Texture2D texture2D = ((DownloadHandlerTexture)request.downloadHandler).texture;
            buttonClone.GetComponentInChildren<Image>().sprite = Sprite.Create(texture2D, new(0, 0, texture2D.width, texture2D.height), new Vector2(0.5f, 1f));
            buttonClone.GetComponentInChildren<TextMeshProUGUI>().SetText(Web.character_data[key].frame);
            buttonClone.onClick.AddListener(() => OpenInfoPanel(key));
            buttonClone.gameObject.SetActive(true);
        }
    }

    public void OpenInfoPanel(string frame)
    {
        StartCoroutine(Co_OpenInfoPanel(frame));
    }
    public IEnumerator Co_OpenInfoPanel(string frame)
    {
        yield return Web.GetCharacterDescription(frame);
        GDRUIManager.GetInstance().OpenPanel(character_infoPanel.transform);
        frameName.SetText(frame);
        string notes = Web.note.Replace(";", "\n\n");
        frameDesc.SetText(notes);
    }
}

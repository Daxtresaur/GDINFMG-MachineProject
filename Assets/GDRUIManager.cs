using UnityEngine;
using UnityEngine.UI;

public class GDRUIManager : MonoBehaviour
{
    private static GDRUIManager instance;
    private void Awake()
    {
        if(instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }
    public static GDRUIManager GetInstance()
    {
        if(instance == null)
        {
            instance = new();
        }

        return instance;
    }

    [SerializeField] private Transform main_parentPanel;

    public void OpenPanel(Transform obj)
    {
        obj.gameObject.SetActive(true);
        obj.SetAsLastSibling();
    }

    public void ClosePanel(Transform obj)
    {
        obj.gameObject.SetActive(false);
    }

    public void SetButtonInteractable(Button button, bool isInteractable)
    {
        button.interactable = isInteractable;
    }
 }

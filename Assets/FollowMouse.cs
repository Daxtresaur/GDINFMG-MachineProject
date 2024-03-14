using UnityEngine;

public class FollowMouse : MonoBehaviour
{
    [SerializeField] private Vector3 offset;
    // Update is called once per frame
    private void Update()
    {
        Vector3 pos = Input.mousePosition;
        transform.position = Camera.main.WorldToViewportPoint(pos);
    }
}

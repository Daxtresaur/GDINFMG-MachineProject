using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ToggleScript : MonoBehaviour
{
    public Toggle toggle1;
    public Toggle toggle2;
    public Toggle toggle3;

    private void Start()
    {
        toggle1.onValueChanged.AddListener(delegate { ToggleValueChanged(toggle1); });
        toggle2.onValueChanged.AddListener(delegate { ToggleValueChanged(toggle2); });
        toggle3.onValueChanged.AddListener(delegate { ToggleValueChanged(toggle3); });
    }

    private void ToggleValueChanged(Toggle changedToggle)
    {
        if (changedToggle.isOn)
        {
            // Turn off other toggles
            if (changedToggle != toggle1) toggle1.isOn = false;
            if (changedToggle != toggle2) toggle2.isOn = false;
            if (changedToggle != toggle3) toggle3.isOn = false;
        }
    }
}

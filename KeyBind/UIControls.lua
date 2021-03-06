local name, addon = ...
function addon:CreateControls()
  local Controls = CreateFrame("Frame", 'KBControlsFrame', UIParent)
  tinsert(UISpecialFrames, Controls:GetName());
  local Keyboard = addon.keyboardFrame
  local Mouse = self.mouseFrame
  local modif = self.modif


  Controls:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }});
  Controls:SetBackdropColor(0,0,0,0.8);
  Controls:EnableMouse(true)
  Controls:SetMovable(true)
  Controls:SetSize(250, 180)
  Controls:SetPoint("TOPLEFT", UIParent, "CENTER", -400, 400)
  Controls:SetScript("OnMouseDown", function(s) s:StartMoving() end)
  Controls:SetScript("OnMouseUp", function(s) s:StopMovingOrSizing() end)

  Controls.Close = CreateFrame("Button",nil, Controls, "UIPanelButtonTemplate")
  Controls.Close:SetSize(15, 15)
  Controls.Close:SetText("X")
  Controls.Close:SetScript("OnClick", function(s) Controls:Hide() Keyboard:Hide() end)
  Controls.Close:SetPoint("TOPRIGHT", Controls, "TOPRIGHT")

  Controls.Slider = CreateFrame("Slider", "KeyBind_Slider1", Controls, "OptionsSliderTemplate")


	Controls.Slider:SetMinMaxValues(0.5,1)
	Controls.Slider:SetValueStep(0.05)
	Controls.Slider:SetValue(1)
	_G[Controls.Slider:GetName().."Low"]:SetText("0.5")
	_G[Controls.Slider:GetName().."High"]:SetText("1")
	Controls.Slider:SetScript("OnValueChanged",
				function(self) Keyboard:SetScale(self:GetValue()) Mouse:SetScale(self:GetValue())end)

	Controls.Slider:SetWidth(200)
	Controls.Slider:SetHeight(20)
	Controls.Slider:SetPoint("BOTTOMLEFT", Controls, "BOTTOMLEFT", 15, 15)



  Controls.AltCB = CreateFrame("CheckButton", "KeyBindAltCB", Controls, "ChatConfigCheckButtonTemplate");
  _G[Controls.AltCB:GetName().."Text"]:SetText ("Alt")
  Controls.AltCB:SetHitRectInsets(0,-40,0,0)
  Controls.AltCB:SetPoint("TOPLEFT", Controls, "TOPLEFT", 10, -40)
  Controls.AltCB:SetScript("OnClick", function(s) if s:GetChecked() then modif.ALT = "ALT-" else modif.ALT = "" end addon:RefreshKeys() end)
  Controls.AltCB:SetSize(20, 20)




  Controls.ShiftCB = CreateFrame("CheckButton", "KeyBindShiftCB", Controls, "ChatConfigCheckButtonTemplate");
  _G[Controls.ShiftCB:GetName().."Text"]:SetText ("Shift")
  Controls.ShiftCB:SetHitRectInsets(0,-40,0,0)
  Controls.ShiftCB:SetPoint("TOPLEFT", Controls, "TOPLEFT", 10, -70)
  Controls.ShiftCB:SetScript("OnClick", function(s) if s:GetChecked() then modif.SHIFT = "SHIFT-" else modif.SHIFT = "" end addon:RefreshKeys() end)
  Controls.ShiftCB:SetSize(20, 20)


  Controls.CtrlCB = CreateFrame("CheckButton", "KeyBindCtrlCB", Controls, "ChatConfigCheckButtonTemplate");
  _G[Controls.CtrlCB:GetName().."Text"]:SetText ("Ctrl")
  Controls.CtrlCB:SetHitRectInsets(0,-40,0,0)
  Controls.CtrlCB:SetPoint("TOPLEFT", Controls, "TOPLEFT", 10, -100)
  Controls.CtrlCB:SetScript("OnClick", function(s) if s:GetChecked() then modif.CTRL = "CTRL-" else modif.CTRL = "" end addon:RefreshKeys() end)
  Controls.CtrlCB:SetSize(20, 20)


  Controls.Mouse = CreateFrame("Button", nil, Controls, "UIPanelButtonTemplate")
  Controls.Mouse:SetSize(80, 20)
  Controls.Mouse:SetPoint("TOPRIGHT", Controls, "TOPRIGHT", -10, -30)
  Controls.Mouse:SetText("Mouse")
  Controls.Mouse:SetScript("OnClick", function(s) if Mouse:IsShown() then Mouse:Hide() else Mouse:Show() end end)

  Controls.Keyboard = CreateFrame("Button", nil, Controls, "UIPanelButtonTemplate")
  Controls.Keyboard:SetSize(80, 20)
  Controls.Keyboard:SetPoint("TOPRIGHT", Controls.Mouse, "BOTTOMRIGHT", 0, -5)
  Controls.Keyboard:SetText("Keyboard")
  Controls.Keyboard:SetScript("OnClick", function(s) if Keyboard:IsShown() then Keyboard:Hide() else Keyboard:Show() end end)


  Controls:Hide()
  addon.controlsFrame = Controls
  return Controls
end

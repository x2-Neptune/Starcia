__StarciaProtector = {"Protect By Starcia [ Alchemy Hub ]"}
game:GetService("Players").LocalPlayer.DisplayName = __StarciaProtector[1]
local name_frame = game:GetService("CoreGui").PlayerList.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
local p_int = "p_"..tostring(game.Players.LocalPlayer.UserId)
name_frame[p_int].ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text = __StarciaProtector[1]

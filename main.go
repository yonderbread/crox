package main

import (
  "fmt"
  "github.com/dontpanic92/wxGo/wx"
)

type MainDialog struct {
  wx.Dialog
}

func NewMainDialog() MainDialog {
  f := MainDialog{}
  f.Dialog = wx.NewDialog(wx.NullWindow, -1, "Crox", wx.DefaultPosition, wx.NewSizeT(600, 400))
  f.Layout()
  f.Centre(wx.BOTH)
  return f
}

func main() {
  fmt.Println("Started crox.")
  
  wx.NewApp()
  f := NewMainDialog()
  f.ShowModal()
  f.Destroy()
  return
}

$ErrorActionPreference = "Stop"
$notificationTitle = "Your Exodus wallet is outdated and you could risk losing access to your wallet. Update now or redownload securely from exodus.com"
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01)
$toastXml = [xml] $template.GetXml()
$toastXml.GetElementsByTagName("text").AppendChild($toastXml.CreateTextNode($notificationTitle)) > $null
$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($toastXml.OuterXml)
$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
$toast.Tag = "Test1"
$toast.Group = "Test2"
$toast.ExpirationTime = [DateTimeOffset]::Now.AddSeconds(5)
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("EXODUS 24.51.4")
$notifier.Show($toast);
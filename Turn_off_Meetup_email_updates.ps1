$groupIdsMap = @{
  "cityzenlondon" = "33943810"
}

$updateTypes = @(
  "org_event_broadcast" # Event updates from organizers
)

# Replace this section when necessary with $session.Cookies.Add calls from copying request in browser again
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36"
$session.Cookies.Add((New-Object System.Net.Cookie("orion_lsid", "5157a049-d619-4365-8d33-9360029949ab", "/", "www.meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("SIFT_SESSION_ID", "a2fb49d7-b959-4f6c-a2bb-e2455f006b29", "/", "www.meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("MEETUP_TRACK", "id=1f3818bb-23cb-4089-a185-2353e4e4c9b8", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("COOKIE_ID_PICOX_ID", "164da65a-894b-41d0-9684-c803acc7d29c", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("__stripe_mid", "fcd9c6de-4ba5-4da3-be71-86c991d953f2cdf7d4", "/", ".www.meetup.com")))
$gStateCookieValue = "{`"i_l`":0,`"i_ll`":1763934963836,`"i_b`":`"eJ286DxNoJoYKmdNOE5K2F2Lg3h1lyga0HHiNJqDQdM`"}"
$encodedGState = [System.Net.WebUtility]::UrlEncode($gStateCookieValue)
$session.Cookies.Add((New-Object System.Net.Cookie("g_state", $encodedGState, "/", "www.meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("__meetup_auth_access_token", "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJzdWIiOiIxNzM5MzI3MzIiLCJuYmYiOjE3NjM5MzQ5ODMsInJvbGUiOiJmaXJzdF9wYXJ0eSIsImlzcyI6Ii5tZWV0dXAuY29tIiwicXVhbnR1bV9sZWFwZWQiOmZhbHNlLCJyZWZyZXNoX3Rva2Vuc19jaGFpbl9pZCI6IjU1NjRkZDExLTI5ZTQtNDM0Zi1iMDUxLWEwYmFkOWRhNjFlZCIsImV4cCI6MTc2MzkzODU4MywiaWF0IjoxNzYzOTM0OTgzLCJqdGkiOiJkMjU2YTY0Mi00ZmMyLTRhYWMtOGQ2OS05ODQ5YzIyOWZmYzEifQ.JZjLyXS3BVvZnfIX0gyPVWbAKXdx-kUP02oLE4fdH1iRqJugqaiaEq8OHhy5QeB0RRnWVI_Zrxdns_MTv1_6tA", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("isSpooner", "false", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("MEETUP_SESSION", "8608cb83-fd77-4d5c-aa74-cd4f9ef17a0c", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("memberId", "173932732", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("RoktRecogniser", "9fd13925-52f9-431f-b58b-8b6d17ac3ebf", "/", "www.meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("MEETUP_BROWSER_ID", "id=c05a07ad-ef5e-4ae4-af0e-125437f33f4b", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("step-up-dismissed-banners", "[%2232869457%22]", "/", "www.meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("USER_CHANGED_DISTANCE_FILTER", "false", "/", "www.meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("ab.storage.sessionId.4e505175-14eb-44b5-b07f-b0edb6050714", "%7B%22g%22%3A%2221e3e2fd-6ed6-a852-0cd4-fb802da7eb1f%22%2C%22e%22%3A1773702062414%2C%22c%22%3A1773700262415%2C%22l%22%3A1773700262415%7D", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("ab.storage.deviceId.4e505175-14eb-44b5-b07f-b0edb6050714", "%7B%22g%22%3A%2247751f8c-d1e5-4628-d51d-aa87d034bfa9%22%2C%22c%22%3A1702140147254%2C%22l%22%3A1773700262417%7D", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("ab.storage.userId.4e505175-14eb-44b5-b07f-b0edb6050714", "%7B%22g%22%3A%22173932732%22%2C%22c%22%3A1702140147267%2C%22l%22%3A1773700262417%7D", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("MEETUP_CSRF", "58a0d4db-58dc-4a83-9fe2-9e50a372eb51", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("__stripe_sid", "ef34f968-eb97-475e-98fb-a1128cc6bc19800a74", "/", ".www.meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("MEETUP_MEMBER_LOCATION", "lat=51.48&lon=-0.27&city=London&state=17&country=gb&timeZone=Europe%252FLondon", "/", "www.meetup.com")))

foreach ($group in $groupIdsMap.GetEnumerator())
{
  $groupName = $group.Key
  $groupId = $group.Value
  
  foreach ($updateType in $updateTypes)
  {     
    $body = "{`"operationName`":`"updateMembershipPreferences`",`"variables`":{`"groupId`":`"$groupId`",`"preferences`":[{`"name`":`"$updateType`",`"value`":`"NO_RECEIVE`"}]},`"extensions`":{`"persistedQuery`":{`"version`":1,`"sha256Hash`":`"202b74346f864efb8eb0aefa4756671746e86e07f331580366f2eb4a0cd70858`"}}}"

    Invoke-WebRequest -UseBasicParsing -Uri "https://www.meetup.com/gql2" `
    -Method "POST" `
    -WebSession $session `
    -Headers @{
    "authority"="www.meetup.com"
      "method"="POST"
      "path"="/gql2"
      "scheme"="https"
      "accept"="*/*"
      "accept-encoding"="gzip, deflate, br, zstd"
      "accept-language"="undefined"
      "apollographql-client-name"="nextjs-web"
      "baggage"="sentry-environment=production,sentry-public_key=5d12cd2317664353456ab4c40d079af2,sentry-trace_id=2e44fa2f253546148a4d5af060aaaf6c,sentry-org_id=6787,sentry-transaction=%2Faccount%2Fcomm%2F%5Burlname%5D,sentry-sampled=false,sentry-sample_rand=0.3792532898857902,sentry-sample_rate=0.1"
      "dnt"="1"
      "origin"="https://www.meetup.com"
      "priority"="u=1, i"
      "referer"="https://www.meetup.com/account/comm/$groupName/"
      "sec-ch-ua"="`"Not:A-Brand`";v=`"99`", `"Brave`";v=`"145`", `"Chromium`";v=`"145`""
      "sec-ch-ua-mobile"="?0"
      "sec-ch-ua-platform"="`"Linux`""
      "sec-fetch-dest"="empty"
      "sec-fetch-mode"="cors"
      "sec-fetch-site"="same-origin"
      "sec-gpc"="1"
      "sentry-trace"="2e44fa2f253546148a4d5af060aaaf6c-83518ba13b904cdc-0"
    } `
    -ContentType "application/json" `
    -Body $body
  }
}
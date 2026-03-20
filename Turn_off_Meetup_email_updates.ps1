$groupIdsMap = @{
  "19985376" = "Elite-Parties-London"
  "31600778" = "netinlondon"
  "543596" = "london-dot-net"
  "1730379" = "london-elite-social"
  "36730251" = "meetup-group-yfjszxns"
  "18972375" = "aiseceng-london"
  "545136" = "Backabush"
  "36551111" = "balancers"
  "36926044" = "cambridge-hiking-club"
  "37201468" = "cambridgepopupgroup"
  "36299590" = "wavehoover"
  "13086952" = "chaos_cooking_cambridge"
  "33943810" = "cityzenlondon"
  "34083538" = "findcltv"
  "37916674" = "data-and-ai-leaders-uk"
  "38104362" = "debait-build-confidence-to-speak-your-mind"
  "37272918" = "chill-coding-developer-meetup-group"
  "1594214" = "FSharpLondon"
  "37529789" = "generative-ai-uk-community"
  "27806016" = "passionate-about-travelling-food-and-events"
  "3554552" = "UK-Hackathons-and-Jams"
  "37470994" = "its-a-date-singles-events"
  "28434929" = "Jordan-Peterson-Fans"
  "3889502" = "london-net-user-group"
  "37194033" = "londonlondonlondon"
  "37755343" = "london-singles-looking-to-connect-in-real-life"
  "33018092" = "london-singles-parties-meetup-group"
  "1546308" = "LondonSocialRunners"
  "38157273" = "london-society-of-explorers"
  "32869457" = "London-Theater-Meetup-Group"
  "21075569" = "mariannas-events-london-nightlife-social-20s-30s-40s"
  "32685397" = "microsoft-reactor-london"
  "30384063" = "north-london-house-concerts"
  "18711362" = "nurnberg-aws-user-group"
  "38399048" = "openclaw-london"
  "1754359" = "outdooraholics"
  "3204512" = "Putney-Social-group"
  "27162885" = "silicon-drinkabout-cambridge"
  "1761047" = "siliconroundabout"
  "25339261" = "single-and-social-london-over-35"
  "20233245" = "single-and-social-london-over-30"
  "1684484" = "london-singles-club"
  "37006846" = "men-who-are-bored-of-dating-apps"
  "3851882" = "Londonandsingle"
  "38084295" = "software-architecture-or-system-design-training"
  "37510289" = "on-net"
  "33323197" = "true-dating"
  "315983" = "london_cultureseekers"
  "37526834" = "the-techie-brunch-club"
  "2600652" = "thirsties"
}

# Note, the values for on can be "ON", "RECEIVE" or "ROLLUP"; the values for off can be "OFF" or "NO_RECEIVE".
# Do not understand the pattern here.
$updateTypes = @{
  # commented out types that are only applicable to organisers
  #"new_member_email" = "NO_RECEIVE"
  #"dues_notify" = "NO_RECEIVE"
  #"member_leave" = "NO_RECEIVE"
  "event_announce" = "NO_RECEIVE"  # New event announcements
  "rsvp_confirm" = "OFF"  # My RSVP is confirmed
  #"rsvp_alert" = "NO_RECEIVE"
  "event_update" = "OFF"  # Changes to event time or location
  "event_comments" = "OFF"  # New comments on events you’re attending or attended
  "event_reminder" = "NO_RECEIVE"  # Event reminders
  "post_event_rating" = "OFF"  # Event rating requests
  "org_event_broadcast" = "NO_RECEIVE"  # Event updates from organizers
  "photo_upload" = "OFF"  # New photos uploaded to event albums
  "photo_comment" = "OFF"  # Someone tags or comments on my photo
  "org_broadcast" = "NO_RECEIVE"  # Announcement to members about the group
  #"venue_change" = "NO_RECEIVE"  # does not seem to be only applicable to organisers, but it appears not to be displayed on the page
  "conversation_announce" = "OFF"  # Discussion invitations
  #"pending_member" = "NO_RECEIVE"
}

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
$gStateCookieValue = "{`"i_l`":0,`"i_ll`":1774020283479,`"i_b`":`"/QP2UjoM20MkKUNuWplFGWtos4QzDDsLefEFAVignZE`",`"i_e`":{`"enable_itp_optimization`":0}}"
$encodedGState = [System.Net.WebUtility]::UrlEncode($gStateCookieValue)
$session.Cookies.Add((New-Object System.Net.Cookie("MEETUP_CSRF", "f68c940e-5c4b-4b7d-9b93-d4d3c71210fa", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("ab.storage.sessionId.4e505175-14eb-44b5-b07f-b0edb6050714", "%7B%22g%22%3A%2292d23cca-42a6-0b16-2dbf-921396b89418%22%2C%22e%22%3A1774022994450%2C%22c%22%3A1774021194452%2C%22l%22%3A1774021194452%7D", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("ab.storage.deviceId.4e505175-14eb-44b5-b07f-b0edb6050714", "%7B%22g%22%3A%2247751f8c-d1e5-4628-d51d-aa87d034bfa9%22%2C%22c%22%3A1702140147254%2C%22l%22%3A1774021194454%7D", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("ab.storage.userId.4e505175-14eb-44b5-b07f-b0edb6050714", "%7B%22g%22%3A%22173932732%22%2C%22c%22%3A1702140147267%2C%22l%22%3A1774021194454%7D", "/", ".meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("__Host-NEXT_MEETUP_CSRF", "ea031959-1d6c-43a4-bb31-c9c1f3cad6ca", "/", "www.meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("__stripe_sid", "6e7fd5ab-354c-49e8-b142-0f771836759fb74ef5", "/", ".www.meetup.com")))
$session.Cookies.Add((New-Object System.Net.Cookie("MEETUP_MEMBER_LOCATION", "lat=51.48&lon=-0.27&city=London&state=17&country=gb&timeZone=Europe%252FLondon", "/", "www.meetup.com")))

Write-Output "Starting to update preferences for $($groupIdsMap.Count) groups and $($updateTypes.Count) update types..."

foreach ($group in $groupIdsMap.GetEnumerator())
{
  $groupId = $group.Key
  $groupName = $group.Value
  
  foreach ($updateType in $updateTypes.GetEnumerator())
  {     
    $updateTypeId = $updateType.Key
    $updateTypeValue = $updateType.Value

    $body = "{`"operationName`":`"updateMembershipPreferences`",`"variables`":{`"groupId`":`"$groupId`",`"preferences`":[{`"name`":`"$updateTypeId`",`"value`":`"$updateTypeValue`"}]},`"extensions`":{`"persistedQuery`":{`"version`":1,`"sha256Hash`":`"202b74346f864efb8eb0aefa4756671746e86e07f331580366f2eb4a0cd70858`"}}}"

    Write-Output "Updating $updateTypeId preference for $groupName to $updateTypeValue..."

    $response = Invoke-WebRequest -UseBasicParsing -Uri "https://www.meetup.com/gql2" `
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

    $expectedResponse = '{"data":{"updateMembershipPreferences":{"errors":null,"__typename":"UpdateMembershipPreferencesPayload"}}}'

    if ($response.StatusCode -eq 200 -and $response.Content -eq $expectedResponse) {
      Write-Host "Done" -ForegroundColor Green
    } else {
      Write-Host "Failed - HTTP Status: $($response.StatusCode), Response: $($response.Content)" -ForegroundColor Red
    }

    Start-Sleep -Seconds 3
  }
}

Write-Output "Finished updating preferences for all groups and update types."
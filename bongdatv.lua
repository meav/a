local cach = 0 
-----------------------------------------------------------------------------------------
		if m_simpleTV.Control.ChangeAdress ~= 'No' then return end
	local inAdr = m_simpleTV.Control.CurrentAdress
		if not inAdr then return end
		if not inAdr:match('https?://bongdanet%.tv') and not inAdr:match('https?://thucdem%.tv') and not inAdr:match('https?://live%.90phut%.tv') and not inAdr:match('https?://ngoac%.tv') then return end
	m_simpleTV.Control.ChangeAdress = 'Yes'
	m_simpleTV.Control.CurrentAdress = 'error'
	local ua = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.2785.143 Safari/537.36'
	local session = m_simpleTV.Http.New(ua)
		if not session then return end
	m_simpleTV.Http.SetTimeout(session, 8000)
	local rc, answer = m_simpleTV.Http.Request(session, {url = inAdr})
		if rc ~= 200 then m_simpleTV.Http.Close(session) return end
	local retAdr = answer:match('http[^\'\"<>]+%.m3u8[^<>\'\"]*')
		if not retAdr then return end
	retAdr = retAdr .. '$OPT:http-user-agent=' .. ua .. '$OPT:http-referrer=' .. inAdr
	if cach >= 100 and cach <= 5000 then retAdr = retAdr .. '$OPT:network-caching=' .. cach end
	m_simpleTV.Http.Close(session)
	m_simpleTV.Control.CurrentAdress = retAdr
-- debug_in_file(retAdr .. '\n')
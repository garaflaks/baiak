local t = {
    storage = 54555,
    temp = 5
}

function onLogin(cid)
    setPlayerStorageValue(cid, t.storage, os.time() + t.temp)
return true
end
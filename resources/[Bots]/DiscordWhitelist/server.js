//////////////////////////////////////////
//           Discord Whitelist          //
//             Made By FAXES            //
//////////////////////////////////////////

/// Config Area ///

var enableWhitelist = true; // Enable the Whitelist/Allowlist
var guildId = "960549387476545546"; // Guild ID for a Discord Server, see https://faxes.zone/i/zjKnd.png
var botToken = "OTc4ODYxMDM0ODc2MDQ3Mzgx.Gtp2px.1EAgYh_HPeNdSngnzSNr20SqI10TVby-KEPVJ4"; // This must be a Discord bot token, create a bot @ https://discord.com/developers/applications

var whitelistRoles = [ // Roles by ID that are whitelisted.
    "960551251974688819", 
    "960551060739612734", 
    "960551388381868084", 
    "960551464240054393", 
    "971914795165028413",
    
    "960633364568744029",
];
var blacklistRoles = [ // Roles by Id that are blacklisted.
    "960551303791132713",
	"986150600666406922",

];

var notWhitelistedMessage = "Você não está na whitelist.Este servidor possui whitelist e requer acesso para ingressar.";
var noGuildMessage = "Discord não detectado.Parece que você não está no servidor de discord deste condado.";
var blacklistMessage = "Você não está na lista deste servidor.";
var debugMode = false; // 
var cacheMaxTime = "0"; // This is the time it takes for refreshes (cache) to have to reload when fetching Discord roles.

/// Code ///
var work = true;
var cache = {};
const axios = require('axios').default;
const ms = require('ms');
axios.defaults.baseURL = 'https://discord.com/api/v9';
axios.defaults.headers = {
    
};
const version = '4.1.1'

getUserDiscord = async function(source, callback) {
    if(typeof source == 'string') return source;
    if(!GetPlayerName(source)) return false;
    let arr = []
    for(let index = 0; index <= GetNumPlayerIdentifiers(source); index ++) {
        if(GetPlayerIdentifier(source, index)) {
            arr.push(GetPlayerIdentifier(source, index))
        }
    }
    setTimeout(() => {
        const found = arr.find(e => e.startsWith('discord:'));
        if(found) {
            callback(found.replace('discord:', ''));
        } else {
            callback(null);
        }
    }, 10000);
}

setTimeout(async () => {
    let botAccount = await axios({
        method: 'GET',
        url: `https://discord.com/api/v9/users/@me`,
        headers: {
            'Content-Type': 'application/json',
            Authorization: `Bot ${botToken}`
        },setTimeout
    }).catch(async (err) => {
        console.log(`[${version}] ^5Bot token is incorrect, ensure your token is correct. ^1Stopping...^7`);
        work = false;
    });

    if(botAccount.data) {
        await axios({
            method: 'GET',
            url: `https://discord.com/api/v9/guilds/${guildId}`,
            headers: {
                'Content-Type': 'application/json',
                Authorization: `Bot ${botToken}`
            },
        }).catch(async (err) => {
            console.log(`[${version}] ^5Guild ID is incorrect or bot isn't in guild. ^1Stopping...^7`);
            console.log(`[${version}] ^5Invite: https://discord.com/api/oauth2/authorize?client_id=${botAccount.data.id}&permissions=1024&scope=bot ^7`);
            work = false;
        });
    }
}, 2000);

// 0 = Not whitelisted
// 1 = Whitelisted
// 2 = Expired cache / refresh
// 3 = Blacklisted
function checkCache(userId) {
    if(cache[userId]) { // Check cache
        // Check timeout
        if(Date.now() > cache[userId].timeAt) { // cache expired
            return 2
        } else {
            if(cache[userId].passed == 1) {
                return 1
            } else if(cache[userId].passed == 3) {
                return 3
            } else {
                return 0
            }
        }
    } else {
        return 2
    }
}

on('playerConnecting', async (name, setKickReason, deferrals) => {
    if(!work) return;
    if(!enableWhitelist) return;
    let src = global.source;
    deferrals.defer();
    setTimeout(() => {
        deferrals.update(`Olá ${name}. Seu ID de discord está sendo verificado com a nossa lista.`)
        setTimeout(async function() {
            getUserDiscord(src, async function(userId) {
                if(userId) {
                    let cacheCheck = await checkCache(userId);
                    if(cacheCheck == 1) {
                        if(debugMode) console.log(`[${version}] ^5${name} foi permitido entrar no servidor^7`)
                        return deferrals.done();
                    } else if(cacheCheck == 3) {
                        if(debugMode) console.log(`[${version}] ^5${name} não está na lista do servidor^7`)
                        return deferrals.done(blacklistMessage);
                    } else if(cacheCheck == 2) {
                        let resDis = await axios({
                            method: 'GET',
                            url: `https://discord.com/api/v9/guilds/${guildId}/members/${userId}`,
                            headers: {
                                'Content-Type': 'application/json',
                                Authorization: `Bot ${botToken}`
                            },
                        }).catch(async (err) => {
                            // if(debugMode) console.error(JSON.stringify(err))
                            if(debugMode) console.log(`[${version}] ^5${name} não está na guilda.^7`)
                            return deferrals.done(noGuildMessage);
                        });
                        if(!resDis) {
                            cache[userId] = {passed: 0,roles: null,timeAt: Date.now() + ms(cacheMaxTime)}
                            if(debugMode) console.log(`[${version}] ^5Error in Discord call. Maybe consider extending the 'cacheMaxTime' option.^7`)
                            return deferrals.done('There was an error checking your Discord Id. Please contact the server owner.');
                        }
                        if(!resDis.data) {
                            cache[userId] = {passed: 0,roles: null,timeAt: Date.now() + ms(cacheMaxTime)}
                            if(debugMode) console.log(`[${version}] ^5${name} is not in the guild. Cache created^7`)
                            return deferrals.done(noGuildMessage);
                        }
                        let hasRole = false;
                        let hasBlackRole = false;
                        for (let i = 0; i < whitelistRoles.length; i++) {
                            if (resDis.data.roles.includes(whitelistRoles[i])) hasRole = true;
                        };
                        for (let i = 0; i < blacklistRoles.length; i++) {
                            if (resDis.data.roles.includes(blacklistRoles[i])) hasBlackRole = true;
                        }
                        if(hasBlackRole) {
                            cache[userId] = {passed: 3,roles: resDis.data.roles,timeAt: Date.now() + ms(cacheMaxTime)}
                            if(debugMode) console.log(`[${version}] ^5${name} is blacklisted. Cache created^7`)
                            return deferrals.done(blacklistMessage);
                        }
                        if(hasRole) {
                            cache[userId] = {passed: 1,roles: resDis.data.roles,timeAt: Date.now() + ms(cacheMaxTime)}
                            if(debugMode) console.log(`[${version}] ^5${name} is whitelisted. Cache created^7`)
                            return deferrals.done();
                        } else {
                            cache[userId] = {passed: 0,roles: resDis.data.roles,timeAt: Date.now() + ms(cacheMaxTime)}
                            if(debugMode) { 
                                console.log(`[${version}] ^5${name} is not whitelisted. Cache created^7`);
                                console.log(`[${version}] ^5${name}s Roles: ^7`, resDis.data.roles);
                            }
                            return deferrals.done(notWhitelistedMessage);              
                        }
                    } else if(cacheCheck == 0) {
                        if(debugMode) console.log(`[${version}] ^5${name} is not whitelisted.^7`)
                        return deferrals.done(notWhitelistedMessage);
                    }
                } else {
                    return deferrals.done(`O seu Discord não foi detectado. Veja este link com algumas dicas para corrigir esse erro - https://docs.faxes.zone/c/fivem/debugging-discord`);
                }
            });
        }, 0)
    }, 0)
});


// API AND EXPORTS
exports('getRoles', (src) => {
    if(!work) return;
    return new Promise((res, rej) => {
        getUserDiscord(src, function(userId) {
            if(userId) {
                axios(`/guilds/${guildId}/members/${userId}`).then((resDis) => {
                    if(!resDis.data) {
                        res([])
                    }
                    res(resDis.data.roles)
                }).catch((err) => {
                    res([])
                });
            } else {
                res([])
            }
        });
    });
});

exports('userHasRole', (src, roles) => {
    if(!work) return;
    return new Promise((res, rej) => {
        getUserDiscord(src, function(userId) {
            if(userId) {
                axios(`/guilds/${guildId}/members/${userId}`).then((resDis) => {
                    if(!resDis.data) {
                        res(false)
                    }
                    const hasRole = resDis.data.roles.some((cRole, i) => resDis.data.roles.includes(roles[i]));
                    if(hasRole) {
                        res(true)
                    } else {
                        res(false)
                    }
                    
                }).catch((err) => {
                    res(false)
                });
            } else {
                res(false)
            }
        });
    });
});

exports('getName', (src) => {
    if(!work) return;
    return new Promise((res, rej) => {
        getUserDiscord(src, function(userId) {
            if(userId) {
                axios(`/guilds/${guildId}/members/${userId}`).then((resDis) => {
                    if(!resDis.data) {
                        res(null)
                    }
                    res({username: resDis.data.username, discriminator: resDis.data.discriminator, nickname: resDis.data.nick})
                }).catch((err) => {
                    res(null)
                });
            } else {
                res(null)
            }
        });
    });
});

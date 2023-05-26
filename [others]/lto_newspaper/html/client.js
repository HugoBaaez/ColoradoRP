var data
var book = document.getElementsByClassName("flipbook")[0]
var frontimage = document.getElementById("frontimage")
var midimage = document.getElementById("midimage")
var backimage = document.getElementById("backimage")
var inited = false
var editable = false
var currentEditingPageIndex
var _editor
var settings
var onClose
var bookIsOpen = false

document.getElementById("closesettingsbutton").onclick = function() {
    SetClass("w_settings","off")
}

function StartBook(args) {
    if( args == null ) { return false }
    if( args.data == null ) {return false}
    d = args.data
    edit = !!args.edit
    onClose = args.onClose

    SetClass("w_book","off",false)
    SetClass("w_content","off",false)

    if( !inited ) {
        inited = true
        $('.flipbook').turn({
            width:922*1.5,
            height:600*1.5,
            elevation: 50,
            gradients: true,
            autoCenter: true
        });
    }

    editable = edit
    data = d
    frontimage.value = data.frontImage || ""; frontimage.onchange = function() { data.frontImage = frontimage.value }
    midimage.value = data.midImage || ""; midimage.onchange = function() { data.midimage = midimage.value }
    backimage.value = data.backImage || ""; backimage.onchange = function() { data.backimage = backimage.value }

    if( data == null || data == "" || data.pages == null || data.pages.length == 0 ) {
        $(".flipbook").turn("addPage", CreatePageElement(editable))
        $(".flipbook").turn("addPage", CreatePageElement(editable))
        $(".flipbook").turn("addPage", CreatePageElement(editable))
    } else {
        BuildPages()
        $(".flipbook").turn("page",1);
    }
    $(".flipbook").bind("turned", function(event, page, view) {
        document.getElementsByClassName("w_flip")[0].classList.toggle("off",true)
    });
}

function StopBook() {
    SetClass("w_book","off",true)
    SetClass("w_content","off",true)
}

function BuildPages() {
    var pageCount = $(".flipbook").turn("pages")
    for( var i = pageCount; i > 0; i--) {
        if($(".flipbook").turn("hasPage",i) == false ) { continue}
        $(".flipbook").turn("removePage", i);
    }
    for( var i = 0; i < data.pages.length; i++ ) {
        $(".flipbook").turn("addPage", CreatePageElement(editable,data.pages[i]))
    }
}

function CreatePageElement(editable,data) {
    var element = document.createElement("div")
    element.classList.add("w_bookpage")
    element.id = "bookpage" + ($(".flipbook").turn("pages")+1)
    if( data != null && data.background != null ) {
        element.style.backgroundImage = "url('"+data.background+"')"
    }
    if( data != null && data.backgroundColor != null ) {
        element.style.backgroundColor = data.backgroundColor
    }
    if( data != null && data.color != null ) {
        element.style.color = data.color
    }
    var cont = document.createElement("div")
    cont.id = "pagecontent" + ($(".flipbook").turn("pages")+1)
    cont.classList.add("w_pagecontent")
    cont.setAttribute("pageIndex",$(".flipbook").turn("pages")+1)
    cont.innerHTML = data.content || ""
    element.appendChild(cont)
    return element
}

function SetClass(className,otherClassName,enable) {
    if(document.getElementsByClassName(className).length == 1 ) {
        document.getElementsByClassName(className)[0].classList.toggle(otherClassName,enable)} 
		else 
		{document.getElementById(className).classList.toggle(otherClassName,enable)}
}

function index(page) {
    $(".flipbook").turn("page",page);
}

window.addEventListener('message', (event) => {
    let url = new URL(window.location.href);
    if (event.data.type == 'OpenBookGui') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922149957271622/1.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //2 index
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922150494163054/2.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //3 ad
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922151093932133/3.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 4
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922151739850784/4.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 5
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922152545177600/5.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 6
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922153115582525/6.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 7
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922154629746779/7.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 8
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922155263086612/8.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 9
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922155934154813/9.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 10
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922156479418428/10.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },

                {   // 11
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922224779481169/11.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 12
                    content:"",
                    background:"https://media.discordapp.net/attachments/993222475217371257/1108922225421205504/12.png?width=963&height=1362",
                    backgroundColor:"#fff",
                    color:"white",
                },
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'DCarterSlade') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000147968701255811/1.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //2 index
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000147985348427806/2.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //3 ad
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148000594743307/3.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 4
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148016117862500/4.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 5
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148030919553034/5.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 6
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148051379376168/6.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 7
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148075916042351/7.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 8
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148089513979974/8.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 9
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148123806601256/10.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 10
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148139065479271/11.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 11
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148148737540278/12.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 12
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148162540998696/13.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 13
                    content:"",
                    background:"https://media.discordapp.net/attachments/932117760648040508/1000148177707597895/14.png?width=565&height=640",
                    backgroundColor:"#fff",
                    color:"white",
                },
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == "Bestiario") {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
				{	/* 1 */
				content:"",
				background:"https://media.discordapp.net/attachments/983197344062816286/1004927216049725491/book_cover.jpg?width=492&height=683",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 2 */
				content:"",
				background:"https://media.discordapp.net/attachments/983197344062816286/1004927251726467102/pag1.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 3 */
				content:"",
				background:"https://media.discordapp.net/attachments/983197344062816286/1004927300258766930/sumario.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 4 */
				content:"",
				background:"https://media.discordapp.net/attachments/983197344062816286/1004927314636836945/1.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 5 */
				content:"",
				background:"https://media.discordapp.net/attachments/9831979344062816286/1004927325844017242/2.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 6 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944362816286/1004927343762083900/3.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 7 */
				content:"",
				background:"https://media.discordapp.net/attachments/983197944063816286/1004927372954435594/4.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 8 */
				content:"",
				background:"https://media.discordapp.net/attachments/983197944032816286/1004927426171764846/5.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 9 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197943062816286/1004927443154505748/6.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 10 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197934062816286/1004927474527895742/7.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 11 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197934062816286/1004927491372228760/8.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 12 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197934062816286/1004927509009289236/9.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 13 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197344062816286/1004927528084971641/10.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 14 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197344062816286/1004927550025388063/11.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 15 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197344062816286/1004927567494651954/12.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 16 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197934062816286/1004927578139791441/13.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 17 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197934062816286/1004927596439552030/14.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 18 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944032816286/1004927610385608734/15.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 19 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197943062816286/1004927643289927760/16.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 20 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944362816286/1004927655621169285/17.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 21 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944062316286/1004927667134533774/18.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 22 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944362816286/1004927682779295785/19.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 23 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944062836286/1004927698298216499/20.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 24 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944032816286/1004927717571039232/21.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 25 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944063816286/1004927729252175984/22.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 26 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944262816286/1004927743328272494/23.png",
				backgroundColor:"#fff",
				color:"white",
				},
				
				
				{   /* 27 */
				content:"",
				background:"https://cdn.discordapp.com/attachments/983197944262816286/1004927761418297394/24.png",
				backgroundColor:"#fff",
				color:"white",
				},
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'livroinfantil') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048353994893955242/Historias_para_criancas.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //2 index
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048354173479030835/Historias_para_criancas_1.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //3 ad
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048354262721249340/Historias_para_criancas_2.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 4
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048354338621362237/Historias_para_criancas_3.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 5
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048354456435175515/Historias_para_criancas_4.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 6
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048354555382993006/Historias_para_criancas_5.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 7
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048354632503676970/Historias_para_criancas_6.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 8
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048354722261778492/Historias_para_criancas_7.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 9
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048354823755542609/Historias_para_criancas_8.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 10
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048354940126502912/Historias_para_criancas_9.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 11
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048355020967510086/Historias_para_criancas_10.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 12
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048355103041650809/Historias_para_criancas_11.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 13
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048355200643104828/Historias_para_criancas_12.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   // 14
                    content:"",
                    background:"https://media.discordapp.net/attachments/960641129605398558/1048355297200193637/Historias_para_criancas_13.png?width=448&height=634",
                    backgroundColor:"#fff",
                    color:"white",
                },

            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'Tratado') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1027392656067805255/1069368112337670224/Tratado_de_Montana_Reaver_PG01.png?width=478&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //2 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1027392656067805255/1069368111653978203/Tratado_de_Montana_Reaver_PG02.png?width=478&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'separatistacard') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100614503080665158/frente.png?width=331&height=468",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //2 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100614519727865876/verso.png?width=331&height=468",
                    backgroundColor:"#fff",
                    color:"white",
                },
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'livroamaldicoado') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475294365777920/1.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //2 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475308861296697/2.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //3 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475318596292669/3.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //4 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475335574827148/4.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //5 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475346924613733/5.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //6 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475368835661955/6.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //7 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475379803762828/7.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //8 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475389643608145/8.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //9 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475401555423273/9.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //10 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475415606341692/10.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //11 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475426175975445/11.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //12 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475435130826772/12.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //13 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475444907757609/13.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //14 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475453178904697/14.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //15 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475460888051842/15.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //16 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475470782406756/16.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //17 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475496090828871/18.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //18 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475505016307752/19.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //19 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475513409114123/20.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //20 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475522695311450/21.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //21 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475531373322321/22.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //22 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475543398404106/23.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //23 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475552613277696/24.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //24 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475567591145552/25.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //25 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475574146826341/26.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //26 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475583160401950/27.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //27 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475608720474243/29.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //28 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475616349917274/30.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //29 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475627745853540/31.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },
                {   //30 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1067187442643382272/1100475632896450641/32.png?width=367&height=468",
                    backgroundColor:"#000000",
                    color:"white",
                },

            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'Carteira12') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1027392656067805255/1069374297593892914/Autorizacao_Armamento.png?width=478&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'LicencaElefante') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1072218681565782230/1091531396293595206/licenca_elefante.png?width=468&height=468",
                    backgroundColor:"#fff",
                    color:"white",
                },
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'medalhadesertor') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://i.imgur.com/pmXqCHB.png",
                    backgroundColor:"#fff",
                    color:"white",
                },
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'Ccasamento') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/949891460046651422/1075668745307029565/certificado_papel.png?width=485&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
    if (event.data.type == 'livrolemoyne') {
        if (event.data.value == true) {
            $.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
            isOpen = false;
            StartBook({data:{pages:[
                {   //1 cover
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231539156435146/1.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //2 
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231588326244472/2.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //3 
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231588624044112/3.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //4
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231588984750261/4.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //5
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231589274177617/5.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //6
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231589584535632/6.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //7
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231589852991519/7.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //8
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231590184325312/8.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //9
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231620999893002/9.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //10
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231621306056724/10.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //11
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231621561929789/11.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //12
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231621876498562/12.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //13
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231622170083328/13.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //14
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231622493065237/14.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //15
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231622774063194/15.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //16
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231623185125426/16.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
                {   //17
                    content:"",
                    background:"https://media.discordapp.net/attachments/1007752575728238612/1077231639333187614/17.jpg?width=519&height=676",
                    backgroundColor:"#fff",
                    color:"white",
                },
            ],
        },
        edit: (url.searchParams.get("edit") != null),
    })
        bookIsOpen = true;
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook();
            }
        }
    }
})

$(document).keydown(function(e){
    var previous = 37, next = 39, close = 27, close2 = 8;
    switch (e.keyCode) {
        case previous:
        $('.flipbook').turn('previous');
        break;
        case next:
        $('.flipbook').turn('next');            
        break;
        
        case close:
        Post('http://lto_newspaper/close')
        break;

        case close2:
        Post('http://lto_newspaper/close')
        break;
    }
});

function Buy(weapon,isammo) {
    var d = {}
    d.weapon = weapon;
    if (isammo == null) {
        d.isammo = 0
    } else {
        d.isammo = isammo;
    }
    Post('http://lto_newspaper/purchaseweapon',d)
}

Post = function(url,data) {
    var d = (data ? data : {});
    $.post(url,JSON.stringify(d));
};
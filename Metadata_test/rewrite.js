var fs = require('fs');
const { finished } = require('stream');
 
var Metadata = [] ;
var data = {};
// "name": "Solana FishDoggie",
// "description": "A Cute FishDoge, Can do nothing",
// "image": "https://ru19wu06.github.io/FishDoge_FDOGE/MetadataFF/2x/test.jpg",

data['name'] = "dope fishdoge";
data['description'] = "This is a dope fishdoge";
data['image'] = "https://ru19wu06.github.io/FishDoge_FDOGE/MetadataFF/2x/test.jpg";
Metadata.push(data);

var jsonString = JSON.stringify(Metadata);

for(var a=1;a<=3;a++){

    var fileName = String(a);
    
fs.writeFile(fileName, jsonString, function (err) {
    if (err)
        console.log(err);
    else
        console.log('Write operation complete.');
});

}

//https://ru19wu06.github.io/FishDoge_FDOGE/Metadata_test/
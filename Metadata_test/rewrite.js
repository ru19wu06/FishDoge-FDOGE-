var fs = require('fs');
const { finished } = require('stream');
 
var Metadata = {} ;

// "name": "Solana FishDoggie",
// "description": "A Cute FishDoge, Can do nothing",
// "image": "https://ru19wu06.github.io/FishDoge_FDOGE/MetadataFF/2x/test.jpg",

// data['name'] = "dope fishdoge";
// data['description'] = "This is a dope fishdoge";
// data['image'] = "https://ru19wu06.github.io/FishDoge_FDOGE/MetadataFF/2x/test.jpg";
// Metadata.push(data);

var jsonString = JSON.stringify(Metadata);

for(var a=1;a<=5;a++){

    var fileName = String(a);
    var names = 'test'+a;
    var description = 'a fsfs';
    var image = 'https://ru19wu06.github.io/FishDoge_FDOGE/MetadataFF/2x/test.jpg';

    var obj = {
        name:names,
        description:description,
        image:image
    };
    
   // Metadata.push(obj);
    
fs.writeFile(fileName,  JSON.stringify(obj), function (err) {
    if (err)
        console.log(err);
    else
        console.log('Write operation complete.');
});

}

//https://ru19wu06.github.io/FishDoge_FDOGE/Metadata_test/
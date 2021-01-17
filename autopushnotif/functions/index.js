const functions = require("firebase-functions");
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

const msgData;

exports.offerTrigger = functions.firestore.document('messages/{messageId}')
.onCreate((snapshot, context) => {
    msgData = snapshot.data();
    admin.firestore().collection('pushTokens').get().then((snapshots) => {
        let tokens = [];
        if (snapshots.empty) {
            console.log('No Devices');
        } else {
            for(let token of snapshots.docs) {
                tokens.push(token.data().devtoken);
            }
            let payload = {
                "notifications": {
                    "title": "From " + msgData.name,
                    "body": msgData.value,
                    "sound": "default"
                },
                "data": {
                    "sendername": msgData.name,
                    "message": msgData.value
                }
            }
            return admin.messaging().sendToDevice(tokens, payload).then((response) => {
                console.log('Pushed to all devices!');
            }).catch((err) => {
                console.log(err);
            })
        }
    })
})
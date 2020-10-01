// https://firebase.google.com/docs/functions/typescript
import * as functions from 'firebase-functions';
const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors({ origin: true }));

// Add middleware to authenticate requests
// app.use(myMiddleware);

// #region Routes
app.get('/', (req: any, res: any) => res.send("My settings"));
// app.post('/', (req: any, res: any) => res.send("Widgets.create()"));
app.put('/', (req: any, res: any) => res.send("FAKE updated settings"));
app.delete('/', (req: any, res: any) => res.send("FAKE i'm deleted now"));
// #endregion Routes

// Expose Express API as a single Cloud Function:
exports.user = functions.https.onRequest(app);
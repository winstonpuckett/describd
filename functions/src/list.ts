import * as functions from 'firebase-functions';
import express = require('express');
import { Request, Response } from 'express';
const cors = require('cors');
const app = express();

app.use(cors({ origin: true }));

// #region Routes
app.get('/', (req: Request, res: Response) => res.send("All lists"));
app.get('/:id', (req: Request, res: Response) => res.send(`list ${req.params.id}`));
app.post('/', (req: Request, res: Response) => res.send("FAKE created list"));
app.put('/', (req: Request, res: Response) => res.send("FAKE updated list"));
app.delete('/', (req: Request, res: Response) => res.send("FAKE deleted list"));
// #endregion Routes

exports.list = functions.https.onRequest(app);
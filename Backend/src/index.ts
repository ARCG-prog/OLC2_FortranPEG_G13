import express from 'express';
import cors from 'cors'; // Importa cors
import { readFileSync } from 'node:fs';
import * as Parser from './grammar.js';

const app = express();
const PORT = 3001;

// Middleware para habilitar CORS
app.use(cors()); // Habilita CORS
app.use(express.json());

// Endpoint para analizar el código
app.post('/analyze', (req, res) => {
  const input = req.body.code;

  try {
    const output = Parser.parse(input);
    res.json({ success: true, output });
  } catch (error) {
    if (error instanceof Parser.SyntaxError) {
      const location = (error as any).location;
      const message = location
        ? `Error de sintaxis en la línea ${location.start.line}, columna ${location.start.column}: ${(error as any).message}`
        : `Error de sintaxis: ${(error as any).message}`;
      res.status(400).json({ success: false, error: message });
    } else {
      res.status(500).json({ success: false, error: 'Error desconocido' });
    }
  }
});

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
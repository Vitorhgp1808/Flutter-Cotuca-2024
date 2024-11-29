const express = require("express");
const cors = require("cors");
const app = express();
const port = 3001;

// Ativa o CORS para permitir requisições de diferentes origens
app.use(cors());

// Carrega os dados dos monitores do arquivo JSON
const monitores = [
  {
    id: 1,
    nome: "Gabriel Grabalos",
    avatar: "https://avatar.iran.liara.run/public/22",
    horarios: {
      segunda: "07:30 - 11:30",
      terça: "7:30 - 09:00",
      quarta: "10:00 - 12:00",
      sexta: "08:00 - 10:00",
    },
  },
  {
    id: 2,
    nome: "Ricardo Cavassan Martins",
    avatar: "https://avatar.iran.liara.run/public/19",
    horarios: {
      terça: "07:30 - 07:45",
      quarta: "10:00 - 12:00",
      sexta: "08:00 - 10:00",
    },
  },
  {
    id: 3,
    nome: "Beatriz Julia Coutinho",
    avatar: "https://avatar.iran.liara.run/public/62",
    horarios: {
      segunda: "07:30 - 12:15",
      terça: "07:30 - 09:00",
      quarta: "10:00 - 12:00",
      sexta: "08:00 - 10:00",
    },
  },
  {
    id: 4,
    nome: "Marcos Godinho Filho",
    avatar: "https://avatar.iran.liara.run/public/39",
    horarios: {
      segunda: "08:15 - 11:30",
      quarta: "08:15 - 11:30",
      sexta: "08:00 - 10:00",
    },
  },
  {
    id: 5,
    nome: "Anna Clara Ferraz",
    avatar: "https://avatar.iran.liara.run/public/88",
    horarios: {
      segunda: "13:30 - 14:15",
      terça: "10:00 - 13:30",
      quarta: "10:00 - 12:00",
      sexta: "08:00 - 10:00",
    },
  },
];

// Rota para listar todos os monitores
app.get("/monitores", (req, res) => {
    // Retorna uma lista de monitores com ID, nome e avatar
    res.json(monitores.map(({ id, nome, avatar, horarios}) => ({ id, nome, avatar, horarios  })));
});

app.get("/monitores/:id", (req, res) => {
  const monitor = monitores.find((m) => m.id == req.params.id);
  if (monitor) {
    res.json({ nome: monitor.nome, horarios: monitor.horarios });
  } else {
    res.status(404).send("Monitor não encontrado");
  }
});

// Inicia o servidor na porta 3000
app.listen(port, () => {
  console.log(`API rodando em http://localhost:${port}`);
});
import { func } from "./folder/hola.js";
const btn = document.getElementById('btn');
btn.addEventListener('click', () => {
    console.log('Button clicked!');
    func('Mundo');
});

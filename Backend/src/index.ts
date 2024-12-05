import { func } from "./folder/hola.js";


const btn = document.getElementById('btn') as HTMLButtonElement; 
btn.addEventListener('click', () => { 
    console.log('Button clicked!'); 
    func('Mundo');
});
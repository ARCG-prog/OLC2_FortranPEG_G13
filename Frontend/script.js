async function analyzeCode() {
    const inputCode = document.getElementById('inputCode').value;

    try {
        const response = await fetch('http://localhost:3001/analyze', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ code: inputCode }),
        });

        const result = await response.json();

        if (result.success) {
            document.getElementById('outputCode').value = 'Código aceptado\n';
        } else {
            document.getElementById('outputCode').value = 'Error:\n' + result.error;
        }
    } catch (error) {
        document.getElementById('outputCode').value = 'Error de conexión: ' + error.message;
    }
}

// Asignar la función al botón de analizar
document.querySelector('.btn-custom').onclick = analyzeCode;
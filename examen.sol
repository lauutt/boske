pragma solidity ^0.5.9;

contract Examen {
    
    uint8 constant public minNota = 4;
    
    struct Alumno {
        bool corregido;
        bool aprobado;
        uint8 nota;
    }
    
    address public owner;
    
    mapping (address => Alumno) public alumnos;
    
    constructor () public {
        owner = msg.sender;
    }
    
    function ponerNota(address idAlumno, uint8 nota) public {
        require(msg.sender == owner);
        alumnos[idAlumno].corregido = true;
        alumnos[idAlumno].nota = nota;
        if (alumnos[idAlumno].nota >= minNota) {
            alumnos[idAlumno].aprobado = true;
        }
    }
}

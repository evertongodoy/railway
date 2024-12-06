package br.senac.sp.railway.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/railway")
public class RailwayController {

    @GetMapping("/{value}")
    public ResponseEntity<String> getExample(@PathVariable(name = "value") String texto){
        return ResponseEntity.ok().body(texto);
    }

}

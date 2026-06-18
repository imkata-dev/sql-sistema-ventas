# Modelamiento e Implementación de un Sistema Relacional de Gestión de Ventas

Este repositorio contiene la documentación, el diseño lógico y el script de implementación de una base de datos relacional orientada a la gestión de transacciones comerciales. El proyecto ha sido desarrollado bajo estrictos estándares académicos, asegurando la normalización del modelo, la consistencia de los datos y la preservación de la integridad referencial.

## 1. Introducción y Alcance

El objetivo de este proyecto es diseñar e implementar un esquema de base de datos eficiente para un sistema de ventas. El modelo permite registrar el comportamiento transaccional de los clientes, la persistencia del catálogo de productos y el desglose histórico de cada venta a través de una relación de cardinalidad compuesta.

---

## 2. Diagrama Entidad-Relación (DER)

El siguiente modelo conceptual-lógico ha sido vectorizado mediante **Mermaid.js** y se renderiza de forma nativa en la plataforma. Este ilustra las entidades del sistema, sus atributos con tipos de datos asociados y las restricciones de clave primaria (`PK`) y foránea (`FK`).

```mermaid
erDiagram
    CLIENTES ||--o{ VENTAS : "genera"
    PRODUCTOS ||--o{ DETALLE_VENTA : "es registrado en"
    VENTAS ||--|{ DETALLE_VENTA : "comprende"

    CLIENTES {
        int id_cliente PK "GENERATED ALWAYS AS IDENTITY"
        string nombre "VARCHAR(100) NOT NULL"
        string email "VARCHAR(100) NOT NULL, UNIQUE"
    }

    PRODUCTOS {
        int id_producto PK "GENERATED ALWAYS AS IDENTITY"
        string nombre "VARCHAR(100) NOT NULL"
        numeric precio "NUMERIC(10,2) NOT NULL, CHECK (> 0)"
    }

    VENTAS {
        int id_venta PK "GENERATED ALWAYS AS IDENTITY"
        date fecha "DATE NOT NULL"
        int id_cliente FK "INT NOT NULL"
    }

    DETALLE_VENTA {
        int id_detalle PK "GENERATED ALWAYS AS IDENTITY"
        int id_venta FK "INT NOT NULL"
        int id_producto FK "INT NOT NULL"
        int cantidad "INT NOT NULL, CHECK (> 0)"
    }

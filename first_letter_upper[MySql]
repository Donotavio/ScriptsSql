CREATE FUNCTION first_letter_upper (input VARCHAR(255))

RETURNS VARCHAR(255)

DETERMINISTIC

BEGIN
    DECLARE len INT;
    DECLARE i INT;

    SET len   = CHAR_LENGTH(input);
    SET input = LOWER(input); -- Opcional mas pode ser util quando queres formatar nomes
    SET i = 0;

    WHILE (i < len) DO
        IF (MID(input,i,1) = ' ' OR i = 0) THEN
            IF (i < len) THEN
                SET input = CONCAT(
                    LEFT(input,i),
                    UPPER(MID(input,i + 1,1)),
                    RIGHT(input,len - i - 1)
                );
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN input;
END;

CREATE OR REPLACE FUNCTION insert_ageReg() RETURNS TRIGGER AS
$$
BEGIN
    IF NOT EXISTS(SELECT *
                  FROM AgesReg
                  WHERE NumReg = NEW.NumReg
                    AND jour = NEW.Jour
                    AND clAge90 = NEW.ClAge90) THEN
        RETURN NEW;
    END IF;
    RAISE NOTICE 'ALREADY EXISTS, NO INSERT %', NEW;
    RETURN NULL;
END
$$ LANGUAGE plpgsql;

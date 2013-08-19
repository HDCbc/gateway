function map(patient) {
    var targetVitalSignsCodes = {
        "LOINC": ["8310-5"]
    };

    var ageLimit = 20;

    var vitalSignList = patient.vitalSigns();

    var now = new Date(2013, 6, 20);
    var start = new Date(2000, 6, 1);
    var end = addDate(now, 0, 1, 0);

    // Shifts date by year, month, and date specified
    function addDate(date, y, m, d) {
        var n = new Date(date);
        n.setFullYear(date.getFullYear() + (y || 0));
        n.setMonth(date.getMonth() + (m || 0));
        n.setDate(date.getDate() + (d || 0));
        return n;
    }

    // Checks if patient is older than ageLimit
    function population(patient) {
        return (patient.age(now) >= ageLimit);
    }


    // Checks for existence of temperature observation
    function hasTemperature() {
        return vitalSignList.match(targetVitalSignsCodes, start, end).length;
    }

    emit('total_pop', 1);

    if (hasTemperature()) {
        emit("total_temperature", 1);
    }

    if (population(patient)) {
        //emit("senior_pop: " + patient.given() + " " + patient.last(), 1);
        emit(">19_pop", 1);
        if (hasTemperature()) {
            emit(">19_pop_temperature", 1);
        }
    }
}
axios.defaults.baseURL = "http://youthcamp.arcyf.com";


var app = new Vue({
    el: '#app',
    data() {
        return {
            campers: [{
                    "_id": {
                        "$oid": "58bffe63483e4b5a9299b876"
                    },
                    "arrival_day": "tuesday",
                    "arrival_time": "morning",
                    "church": {
                        "type": "default",
                        "name": "Ridge"
                    },
                    "confirm_email": "ghostcubic1@gmail.com",
                    "confirm_phone_number": "0268825838",
                    "date_of_birth": "1990-09-19",
                    "email": "ghostcubic1@gmail.com",
                    "emergency_contact": "Ghost Mahorn",
                    "emergency_number": "0249412051",
                    "first_name": "Eben",
                    "gender": "male",
                    "is_admin": null,
                    "last_name": "Anim",
                    "nationality": "SINGAPORE",
                    "occupation": {
                        "type": "worker"
                    },
                    "other_names": "Cubic",
                    "phone_number": "0268825838",
                    "residence": "Lapaz Nii Boy town",
                    "role": "committee",
                    "service_group": null
                },
                {
                    "_id": {
                        "$oid": "58c80b9e483e4b6a1c781ea0"
                    },
                    "arrival_day": "wednesday",
                    "arrival_time": "morning",
                    "church": {
                        "type": "default",
                        "name": "Ridge"
                    },
                    "confirm_email": "useedhef@gmail.com",
                    "confirm_phone_number": "0268020112",
                    "date_of_birth": "1992-04-14",
                    "email": "useedhef@gmail.com",
                    "emergency_contact": "Patience",
                    "emergency_number": "0277659844",
                    "first_name": "Dickson",
                    "gender": "male",
                    "is_admin": true,
                    "last_name": "Heflide",
                    "nationality": "GHANA",
                    "occupation": {
                        "type": "worker"
                    },
                    "other_names": "",
                    "phone_number": "0268020112",
                    "residence": "North legon ",
                    "role": "camper",
                    "service_group": null
                },
                {
                    "_id": {
                        "$oid": "58e0e72c483e4b65286853bb"
                    },
                    "arrival_day": "wednesday",
                    "arrival_time": "morning",
                    "church": {
                        "type": "default",
                        "name": "Manet"
                    },
                    "confirm_email": "sarpongmensahk@gmail.com",
                    "confirm_phone_number": "0244232428",
                    "date_of_birth": "1996-12-23",
                    "email": "sarpongmensahk@gmail.com",
                    "emergency_contact": "Mrs Jocelyn Sarpong Mensah",
                    "emergency_number": "0244749730",
                    "first_name": "Kwadwo",
                    "gender": "male",
                    "is_admin": null,
                    "last_name": "Mensah",
                    "nationality": "GHANA",
                    "occupation": {
                        "type": "student",
                        "school_location": "Greater Accra Region (Accra)",
                        "educational_level": "tertiary",
                        "school": "other",
                        "school_type": "default",
                        "school_location_type": "default"
                    },
                    "other_names": "Sarpong",
                    "phone_number": "0244232428",
                    "residence": "Gimpa",
                    "role": "camper",
                    "service_group": null
                },
                {
                    "_id": {
                        "$oid": "58e0f6e0483e4b65286853bc"
                    },
                    "arrival_day": "wednesday",
                    "arrival_time": "afternoon",
                    "church": {
                        "type": "default",
                        "name": "Ridge"
                    },
                    "confirm_email": "andrew.amegatcher@gmail.com",
                    "confirm_phone_number": "0267666975",
                    "date_of_birth": "1984-01-12",
                    "email": "andrew.amegatcher@gmail.com",
                    "emergency_contact": "Andrew Ofoe Amegatcher",
                    "emergency_number": "0267666975",
                    "first_name": "Andrew",
                    "gender": "male",
                    "is_admin": null,
                    "last_name": "Amegatcher",
                    "nationality": "GHANA",
                    "occupation": {
                        "type": "worker",
                        "profession": "Building and Construction",
                        "profession_type": "default"
                    },
                    "other_names": "Obuobisa",
                    "phone_number": "0267666975",
                    "residence": "Dansoman",
                    "role": "camper",
                    "service_group": null
                }
            ]
        }

    },
    mounted: function () {
        this.fetchData();

    },

    methods: {
        fetchData() {
           console.log("assuming we were fetching data it would happen here...")
        }

    }
});

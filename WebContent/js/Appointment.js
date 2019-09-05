
// State lists
var states = new Array();

states['Dentist'] = new Array('Dharmesh Mourya','Dinesh Patel', 'Kiran Shah');
states['Cardiology'] = new Array('Ashish Singh','Swati Chauhan','Peter Smith');
states['Pathologist'] = new Array('Kishor Dev','Shashi Desai','Brijesh Thakur');
states['Neurologist'] = new Array('Dharmesh Mourya','Dinesh Patel', 'Kiran Shah');
states['General Physician'] = new Array('Ashish Singh','Swati Chauhan','Peter Smith');
states['Ayurveda'] = new Array('Kishor Dev','Shashi Desai','Brijesh Thakur');
states['ENT Specialist'] = new Array('Dharmesh Mourya','Dinesh Patel', 'Kiran Shah');
states['Homeopathy'] = new Array('Ashish Singh','Swati Chauhan','Peter Smith');
states['Physiotherapy'] = new Array('Kishor Dev','Shashi Desai','Brijesh Thakur');
states['Veterinary Physician'] = new Array('Dharmesh Mourya','Dinesh Patel', 'Kiran Shah');



// City lists
var cities = new Array();

cities['Dentist'] = new Array();
cities['Dentist']['Dharmesh Mourya']= new Array('700');
cities['Dentist']['Dinesh Patel'] = new Array('800');
cities['Dentist']['Kiran Shah'] = new Array('1000');

cities['Cardiology'] = new Array();
cities['Cardiology']['Ashish Singh']=new Array('1500');
cities['Cardiology']['Swati Chauhan']= new Array('1200');
cities['Cardiology']['Peter Smith']= new Array('2000');

cities['Pathologist'] = new Array();
cities['Pathologist']['Kishor Dev'] = new Array('500');
cities['Pathologist']['Shashi Desai']  = new Array('1000');
cities['Pathologist']['Brijesh Thakur'] = new Array('700');

cities['Neurologist'] = new Array();
cities['Neurologist']['Dharmesh Mourya']= new Array('700');
cities['Neurologist']['Dinesh Patel'] = new Array('800');
cities['Neurologist']['Kiran Shah'] = new Array('1000');

cities['Cardiology'] = new Array();
cities['Cardiology']['Ashish Singh']=new Array('1500');
cities['Cardiology']['Swati Chauhan']= new Array('1200');
cities['Cardiology']['Peter Smith']= new Array('2000');

cities['Pathologist'] = new Array();
cities['Pathologist']['Kishor Dev'] = new Array('500');
cities['Pathologist']['Shashi Desai']  = new Array('1000');
cities['Pathologist']['Brijesh Thakur'] = new Array('700');

cities['Ayurveda'] = new Array();
cities['Ayurveda']['Kishor Dev']= new Array('700');
cities['Ayurveda']['Shashi Desai'] = new Array('800');
cities['Ayurveda']['Brijesh Thakur'] = new Array('1000');

cities['ENT Specialist'] = new Array();
cities['ENT Specialist']['Dharmesh Mourya']= new Array('700');
cities['ENT Specialist']['Dinesh Patel'] = new Array('800');
cities['ENT Specialist']['Kiran Shah'] = new Array('1000');

cities['Homeopathy'] = new Array();
cities['Homeopathy']['Ashish Singh']=new Array('1500');
cities['Homeopathy']['Swati Chauhan']= new Array('1200');
cities['Homeopathy']['Peter Smith']= new Array('2000');

cities['Physiotherapy'] = new Array();
cities['Physiotherapy']['Kishor Dev'] = new Array('500');
cities['Physiotherapy']['Shashi Desai']  = new Array('1000');
cities['Physiotherapy']['Brijesh Thakur'] = new Array('700');

cities['Veterinary Physician'] = new Array();
cities['Veterinary Physician']['Dharmesh Mourya']= new Array('700');
cities['Veterinary Physician']['Dinesh Patel'] = new Array('800');
cities['Veterinary Physician']['Kiran Shah'] = new Array('1000');

function setStates() {
  cntrySel = document.getElementById('Department');
  stateList = states[cntrySel.value];
  changeSelect('doc', stateList, stateList);
  setCities();
}

function setCities() {
  cntrySel = document.getElementById('Department');
  stateSel = document.getElementById('doc');
  cityList = cities[cntrySel.value][stateSel.value];
  changeSelect('fees', cityList, cityList);
}

function changeSelect(fieldID, newOptions, newValues) {
  selectField = document.getElementById(fieldID);
  selectField.options.length = 0;
  for (i=0; i<newOptions.length; i++) {
    selectField.options[selectField.length] = new Option(newOptions[i], newValues[i]);
  }
}

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

addLoadEvent(function() {
  setStates();
});

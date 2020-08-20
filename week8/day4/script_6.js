const ARN = {
  UCU: 'Sérine',
  UCC: 'Sérine',
  UCA: 'Sérine',
  UCG: 'Sérine',
  AGU: 'Sérine',
  AGC: 'Sérine',
  CCU: 'Proline',
  CCC: 'Proline',
  CCA: 'Proline',
  CCG: 'Proline',
  UUA: 'Leucine',
  UUG: 'Leucine',
  UUU: 'Phénylalanine',
  UUC: 'Phénylalanine',
  CGU: 'Arginine',
  CGC: 'Arginine',
  CGA: 'Arginine',
  CGG: 'Arginine',
  AGA: 'Arginine',
  AGG: 'Arginine',
  UAU: 'Tyrosine',
  UAC: 'Tyrosine',
};
function convertARNToAcid(str) {
  let arr = str.toUpperCase().match(/.{1,3}/g);
  let result = [];
  arr.forEach((item) => {
    result.push(ARN[item]);
  });
  return result.join('-');
}
// Supprime le livre avec l'ID: 133712 ;
console.log('\n----------------------------------------------------');
console.log('ARN de CCGUCGUUGCGCUACAGC est: ');
console.log(convertARNToAcid('CCGUCGUUGCGCUACAGC'));

console.log('\n----------------------------------------------------');
console.log('ARN de CCUCGCCGGUACUUCUCG est: ');
console.log(convertARNToAcid('CCUCGCCGGUACUUCUCG'));

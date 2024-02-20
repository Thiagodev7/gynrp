const Commands = global['Commands'];

/**
 * Utilize o módulo Commands para definir as ações que serão executadas em uma nova compra
 * Comandos => ADD_BAN, REMOVE_BAN, ADD_GROUP, REMOVE_GROUP, ADD_MONEY, REMOVE_MONEY, ADD_VEHICLE, REMOVE_VEHICLE, ADD_HOME, REMOVE_HOME, ADD_ITEM, JS_CODE, SQL_CODE, SYSTEM_NOTIFY
 * @param {Object} data
 * @param {number} data.id
 * @param {number} data.user_id
 * @param {string} data.command
 * @param {string} data.value
 * @param {number | undefined} data.amount
 * @param {number} data.quantity
 *
 * IMPORTANTE:
 * Retorne uma string em caso de sucesso ou lance um erro em caso de falha. Se nada for retornado o sistema tentará refazer a entrega.
 */

// Exemplo
/*Commands['ADD_VEHICLE'] = (data) => {
  console.log(data);

  const success = true;

  if (success) {
    return 'OK';
  } else {
    throw new Error('Falha na entrega do veículo.');
  }
};*/

module.exports = this;

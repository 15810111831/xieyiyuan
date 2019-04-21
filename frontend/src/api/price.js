import {
    requestGetList
} from './request'


export function getPriceList(params) {
    return requestGetList('/users/api/price/', params)
}